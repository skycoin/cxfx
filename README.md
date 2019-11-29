<img width="100%" height="100%" src="resources/logos/logo_2.png">

## Disclaimer : It’s all wip, api will change until it matures.

## Cx game library.

#### Installation :

##### Install patched cx (cxfx temporarly relies on unpublished cx modifications, this will be fixed in the future):
```
mkdir -p ~/go/src/github.com/skycoin/
cd ~/go/src/github.com/skycoin/
git clone https://github.com/asahi3g/cx/
cd cx
git checkout develop_cxfx
make build
```
##### Install cxfx :
```
mkdir -p ~/go/src/github.com/skycoin/
cd ~/go/src/github.com/skycoin/
git clone https://github.com/skycoin/cxfx
cd cxfx/tutorials
make 6_model
```

##### Controls in tutorials :

```ctrl+(left/right)``` : Switch rendered model
 
```up/down/left/right (or wasd) + mouse``` : Control the camera 

```alt+enter``` : Toggle fullscreen 

```escape``` : Exit 

##### WIP :

<img style="max-width:100%" src="games/skylight/screenshots/skylight_71.png">
<img style="max-width:100%" src="games/skylight/screenshots/skylight_64.png">
<img style="max-width:100%" src="screenshots/cxfx_44.png">
<img style="max-width:100%" src="screenshots/cxfx_42.png">
<img style="max-width:100%" src="screenshots/cxfx_41.png">
<img style="max-width:100%" src="screenshots/cxfx_39.png">
<img style="max-width:100%" src="screenshots/cxfx_38.png">
<img style="max-width:100%" src="screenshots/cxfx_37.png">
<img style="max-width:100%" src="screenshots/cxfx_36.png">
<img style="max-width:100%" src="screenshots/cxfx_35.png">
<img style="max-width:100%" src="screenshots/cxfx_34.png">
<img style="max-width:100%" src="screenshots/cxfx_33.png">
<img style="max-width:100%" src="screenshots/cxfx_32.png">
<img style="max-width:100%" src="screenshots/cxfx_31.png">
<img style="max-width:100%" src="screenshots/cxfx_27.png">
<img style="max-width:100%" src="screenshots/cxfx_15.png">
<img style="max-width:100%" src="screenshots/cxfx_9.png">
<img style="max-width:100%" src="screenshots/cxfx_5.png">
<img style="max-width:100%" src="screenshots/cxfx_4.png">
<img style="max-width:100%" src="screenshots/cxfx_2.png">
<img style="max-width:100%" src="screenshots/cxfx_1.png">
<img style="max-width:100%" src="screenshots/cxfx_0.png">

- [ ] math:
  - [x] matrix
    - [x] basic matrix operations
  - [x] vector
  - [x] quaternion
  - [ ] spline
- [ ] graphics:
  - [ ] textures:
    - [ ] texture 2d
      - [x] generate mipmaps
      - [ ] load mipmaps
    - [ ] texture cube 
      - [x] generate mipmaps
      - [ ] load mipmaps
    - [ ] texture array
    - [ ] texture 3d
    - [ ] texture compression
    - [ ] srgb
  - [ ] shaders:
    - [x] shader permutations
    - [ ] shader hot reload
    - [ ] shader reflection (parse glsl and extract uniforms)
    - [ ] shader uniform binding in gui
  - [ ] rendering:
    - [ ] physically based renderer
      - [x] kronos implementation
        - [ ] debug
      - [ ] diffuse irradiance
      - [ ] specular irradiance
      - [ ] hdr maps
      - [ ] custom brdf
      - [ ] realtime cubemap
    - [x] normal map
    - [x] emmissive map
    - [x] occlusion map
    - [x] output scene depth in a texture
    - [x] multiple render targets
    - [x] order independent transparency
    - [ ] particles
      - [ ] moving emitters
    - [ ] anti aliasing
    - [ ] atmospheric scattering
  - [ ] terrain
- [ ] audio:
  - [x] wav 8bps/16bps
  - [ ] wav f32/f64
  - [ ] 3d audio
  - [ ] audio streaming:
  - [ ] compressed audio
- [ ] phycics:
  - [ ] collision/intersection/response
    - [ ] ellipsoid/triangle
    - [ ] ellipsoid/ellipsoid 
    - [ ] ray/ellipsoid
    - [ ] ray/OBB
    - [ ] ray/AABB
  - [x] gravity
  - [ ] torque
- [ ] cameras:
  - [x] free camera
  - [x] first person camera
  - [x] third person camera
  - [x] smooth motions
  - [ ] cinematic camera
- [ ] gltf support (loader/renderer/exporter):
  - [x] flat mesh
  - [x] textured mesh
  - [x] hierarchical mesh
  - [x] pbr materials
  - [x] skinning
  - [x] animations
  - [ ] cameras
  - [ ] lights
  - [ ] exporter
- [ ] 2d gui toolkit:
  - [x] game screens
  - [x] label
  - [x] picture
  - [x] scrollbar
  - [x] list
  - [ ] json serialization
- [ ] application:
  - [x] resize events
  - [x] toggle fullscreen
  - [ ] cli
  - [ ] mobile:
    - [ ] virtual keyboard
    - [ ] ios
    - [ ] android
- [ ] skycoin:
  - [ ] cxo
  - [ ] cxchain


#### How to contribute :

- testing the tutorials
- writing documentation for the tutorials code
- writing tutorials
- writing apps with cxfx
- writing documentation for the lib (should be driven by the tutorials)
- feedback regarding the usage (what needs to be improved, what functionalities are missing etc)
- 3d assets (synth 3d model and animations, skycoin hardware...)
- audio assets (synth sound pack)

#### Tutorials :

```
make 0_colored_quad
```
<img width="100%" height="100%" src="screenshots/cxfx_0.png">

```
make 1_textured_quad
```
<img width="100%" height="100%" src="screenshots/cxfx_1.png">

```
make 2_text
```
<img width="100%" height="100%" src="screenshots/cxfx_2.png">

```
make 3_perspective
```
<img width="100%" height="100%" src="screenshots/cxfx_5.png">

```
make 4_camera
```
<img width="100%" height="100%" src="screenshots/cxfx_7.png">

```
make 5_batch
```
<img width="100%" height="100%" src="screenshots/cxfx_9.png">

```
make 6_model
```
<img width="100%" height="100%" src="screenshots/cxfx_35.png">
```
make 7_menu
```
TODO : add screenshot

```
make 8_sound
```
TODO : add screenshot

```
make 9_button
```
<img width="100%" height="100%" src="screenshots/cxfx_3.png">

```
make 10_dialog
```
<img width="100%" height="100%" src="screenshots/cxfx_4.png">

