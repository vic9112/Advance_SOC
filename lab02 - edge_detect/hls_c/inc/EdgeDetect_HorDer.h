#pragma once

#include "EdgeDetect_defs.h"
#include <mc_scverify.h>

  class EdgeDetect_HorDer
  {
  public:
    EdgeDetect_HorDer() {}
  
    #pragma hls_design interface
    void CCS_BLOCK(run)(ac_channel<pixelType4x> &pix_in,
                        maxWType                &widthIn,
                        maxHType                &heightIn,
                        ac_channel<pixelType4x> &pix_out,
                        ac_channel<gradType4x>  &dx)
    {
      // pixel buffers store pixel history
      pixelType pix_buf0;
      pixelType pix_buf1;

      pixelType4x pix4; 
      pixelType   win[9];
       
      gradType4x grad;
      maxWType   x4; // x for 4 pixels
  
      // Since we've got 4 pixel at one time, 
      // all "widthIn" in origin code must divided by 4
      HROW: for (maxHType y = 0; ; y++) {
        #pragma hls_pipeline_init_interval 1
        HCOL: for (maxWType x = 0; ; x += 4) { // Add 4
          x4 = x / 4; // Four pixels, s.t. x divided by 4

          if (x4 <= (widthIn / 4) - 1)
            pix4 = pix_in.read();

          if (x4 == 1) // left boundary
          {
            #pragma hls_unroll yes
            for (int i = 1; i < 5; i++) {
              win[i] = win[i + 4];
            }
            #pragma hls_unroll yes
            for (int i = 0; i < 4; i++) {
              win[i + 5] = pix4.slc<8>(i * 8);
            }
            win[0] = win[2];
          }
          else if (x4 == (widthIn / 4)) //right boundary
          {
            #pragma hls_unroll yes
            for (int i = 0; i < 5; i++) {
              win[i] = win[i + 4];
            }
            win[5] = win[3];
          }
          else
          {
            #pragma hls_unroll yes
            for (int i = 0; i < 5; i++) {
              win[i] = win[i + 4];
            }
            #pragma hls_unroll yes
            for (int i = 0; i < 4; i++) {
              win[i + 5] = pix4.slc<8>(i * 8); // Arrange 4 pixels into window
            }
          }

          // Calculate derivative
          #pragma hls_unroll yes
          for(int i = 0; i < 4; i++)
          {
            gradType pix_tmp;
            pix_tmp = win[i]     * hw_kernel[0] + 
                      win[i + 1] * hw_kernel[1] + 
                      win[i + 2] * hw_kernel[2];
            grad.set_slc(i * 9, pix_tmp); // Replaces slice of bits
          }
          // Combine 4 pixels into one pix_tmp
          if (x != 0) { // Write streaming interface
            pixelType4x pix_tmp; 
            pix_tmp.set_slc( 0, win[1]);
            pix_tmp.set_slc( 8, win[2]);
            pix_tmp.set_slc(16, win[3]);
            pix_tmp.set_slc(24, win[4]);
            pix_out.write(pix_tmp);
            dx.write(grad); // derivative out
          }
          // programmable width exit condition
          // Since we have 4 pixels
          if ( x4 == widthIn / 4) {
            break;
          }
        }
        // programmable height exit condition
        if (y == maxHType(heightIn - 1)) { // cast to maxHType for RTL code coverage
          break;
        }
      }
    }
  };


