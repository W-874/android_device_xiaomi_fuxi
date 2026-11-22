#  Device Tree for Xiaomi 13 (fuxi)

## Standalone uwuAOSP build

Select `uwu_fuxi-cp2a-user`. The build also needs the Xiaomi vendor and
MiuiCamera trees and the shared secure-hardware init file at
`device/xiaomi/common/init/init.secure-hardware.rc`. Supply a local RSA-4096
AVB private key with `FUXI_STANDALONE_AVB_KEY` or at `$OUT_DIR/fuxi-avb.pem`.

The Dolby Codec2 service builds from source. Its proprietary libraries are
not included. Before building, populate
`device/xiaomi/fuxi/dolby-vision-recording/lib64/` with the prepared Dolby
libraries from fuxi firmware `OS3.0.309.0.WMCCNXM`:

- `c2.dolby.client.so`, `c2.dolby.store.so`, `c2.dolby.hevc.enc.so`,
  `c2.dolby.hevc.dec.so`, and `c2.dolby.hevc.sec.dec.so`.
- `libEncoderProcessor.so`, `libDecoderProcessor.so`, `libeglcore.so`, and
  `libdolbyottcameracontrol.so`.
- `libfuxi_dv_codec2_soft_common.so` and
  `libfuxi_dv_sfplugin_ccodec_utils.so`, the renamed vendor libraries with
  matching SONAMEs and dependencies.

The prepared client links `libcodec2_shim.so`; the HEVC libraries and the
renamed soft-common library reference the corresponding renamed dependencies.
Do not add the stock `dolbycodec2` executable or local libraries to Git.

## Spec Sheet

| Feature                 | Specification                                                              |
| :---------------------- | :--------------------------------                                          |
| CPU                     | 1x3.2 GHz Cortex-X3 & 2x2.8 GHz Cortex-A715 & 2x2.8 GHz Cortex-A710 & 3x2.0 GHz Cortex-A510|
| Chipset                 | Qualcomm SM8550-AB Snapdragon 8 Gen 2 (4 nm)                                      |
| GPU                     | Adreno 740                                                                 |
| Memory                  | 8 GB / 12 GB                                                                |
| Shipped Software        | Android 13, MIUI 14                                                        |
| Storage                 | 128 GB / 256 GB / 512 GB                                                           |
| Battery                 | 4500 mAh                                                                   |
| Dimensions              | 152.8 x 71.5 x 8.0 mm or 8.1 mm                               |
| Display                 | 6.36 inches, 97.7 cm2 (~89.4% screen-to-body ratio)                       |
| Rear Camera             | 50 MP, f/1.8, 23mm (wide), 1/1.49", 1.0µm, PDAF, OIS                            |
|                         | 10 MP, f/2.0, 75mm (telephoto), 1/3.75", 1.0µm, PDAF, OIS, 3.2x optical zoom                                     |
|                         | 12 MP, f/2.2, 15mm, 120˚ (ultrawide), 1/3.06", 1.12µm                                                   |
| Front Camera            | 32 MP, f/2.0, 22mm (wide), 1/3.14", 0.7µm                                   |
| Release Date            | December 2022                                                               |

## Device Picture

![Xiaomi 13](https://www.giztop.com/media/catalog/product/cache/dc206057cdd42d7e34b9d36e347785ca/p/m/pms_1670745529.40767182.png)