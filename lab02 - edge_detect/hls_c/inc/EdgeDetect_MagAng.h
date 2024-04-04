#pragma once

#include "EdgeDetect_defs.h"
#include <mc_scverify.h>

  class EdgeDetect_MagAng
  {
  public:
    EdgeDetect_MagAng() {}
  
    #pragma hls_design interface
    void CCS_BLOCK(run)(ac_channel<gradType4x>  &dx_in,
                        ac_channel<gradType4x>  &dy_in,
                        ac_channel<pixelType4x> &pix_in,
                        maxWType                &widthIn,
                        maxHType                &heightIn,
                        bool                    &sw_in,
                        uint32                  &crc32_pix_in,
                        uint32                  &crc32_dat_out,
                        ac_channel<Stream_t>    &dat_out)
    {
      gradType4x dx, dy;
      pixelType4x pix4;
      sqType dx_sq;
      sqType dy_sq;
      // sumType sum; // No need to calculate sprt anymore
      // ac_fixed<16,9,false> sq_rt; // May not use it!!

      //=============== New arguments for magnitude and crc32 ================//
      magType4x magn;
      magType4x magn_out;
      Stream_t dat;
      maxWType x4;
      uint32 crc32_pix_in_tmp  = 0XFFFFFFFF;
      uint32 crc32_dat_out_tmp = 0XFFFFFFFF;
      //======================================================================//
  
      MROW: for (maxHType y = 0; ; y++) {
        #pragma hls_pipeline_init_interval 1
        MCOL: for (maxWType x = 0; ; x += 4) {
          x4   = x / 4; // x should be divided by 4
          dx   = dx_in.read();
          dy   = dy_in.read();
          pix4 = pix_in.read();
      //==================== Sum of absolute difference ======================//
          pixelType abs_dx, abs_dy;

          #pragma hls_unroll yes
          for(int i = 0; i < 4; i++) // Iteration 4 times since we calculate 4 pixels
          {
            ac_math::ac_abs(dx.slc<9>(i * 9), abs_dx); // get the absolute value of dx
            ac_math::ac_abs(dy.slc<9>(i * 9), abs_dy); // get the absolute value of dy
            uint9 abs_sum = abs_dx + abs_dy;           // Calculate the sum of them
            ac_fixed<8, 8, false, AC_TRN,AC_SAT> abs_sum_clip = abs_sum; // Fixed type
            magType tmp = (magType) abs_sum_clip.to_uint(); // Convert to unsigned int
            magn.set_slc(i * 8, tmp);
          }

      //= Select the output source from input image and calculated magnitude =//
          if (!sw_in)                                                         //
            magn_out = pix4;                                                  //
          else                                                                //
            magn_out = magn;                                                  //
      //======================================================================//

          dat.pix = magn_out;
          dat.sof = (x4 == 0 && y == 0);
          dat.eol = (x4 == maxWType(widthIn / 4 - 1));

          dat_out.write(dat);
   
      //============ Two crc32 calculation on image input / output ===========//
          crc32_pix_in_tmp  = calc_crc32<32>(crc32_pix_in_tmp,  pix4);        //
          crc32_dat_out_tmp = calc_crc32<32>(crc32_dat_out_tmp, magn_out);    //
      //======================================================================//

          // programmable width exit condition
          if (x4 == maxWType(widthIn / 4 - 1)) { // cast to maxWType for RTL code coverage
            break;
          }
        }
        // programmable height exit condition
        if (y == maxHType(heightIn - 1)) { // cast to maxHType for RTL code coverage
          break;
        }
      }
 
      crc32_pix_in  = ~crc32_pix_in_tmp;
      crc32_dat_out = ~crc32_dat_out_tmp;
    }

  //========================== crc32 code ===========================//
  private:
    template <int len>
    uint32 calc_crc32(uint32 crc_in, ac_int<len, false> dat_in)
    {
      const uint32 CRC_POLY = 0xEDB88320;
      uint32 crc_tmp = crc_in;

      #pragma hls_unroll yes
      for(int i = 0; i < len; i++)
      {
        uint1 tmp_bit = crc_tmp[0] ^ dat_in[i];

        uint31 mask;

        #pragma hls_unroll yes
        for(int i = 0; i < 31; i++)
          mask[i] = tmp_bit & CRC_POLY[i];

        uint31 crc_tmp_h31 = crc_tmp.slc<31>(1);
   
        crc_tmp_h31 ^= mask;
        
        crc_tmp.set_slc(31, tmp_bit);
        crc_tmp.set_slc(0, crc_tmp_h31);
      }
      return crc_tmp;
    }
    
  };


