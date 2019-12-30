## TODO : can't order files alphabetically without breaking tuto 7->14

SKYCOIN = $(GOPATH)/src/github.com/SkycoinProject
CX = $(SKYCOIN)/cx
CXFX = ..
PPROF = --debug-profile=100
OPTS = $(PPROF)
OPTS_MEM = $(OPTS) --stack-size=128M --heap-initial=800M -heap-max=800M

DATA = $(CXFX)/resources/
SRC = $(CX)/lib/args.cx\
	  $(CX)/lib/json.cx\
	  $(CXFX)/src/mat/math.cx\
	  $(CXFX)/src/mat/v1d.cx\
	  $(CXFX)/src/mat/v1f.cx\
	  $(CXFX)/src/mat/v2f.cx\
	  $(CXFX)/src/mat/v3f.cx\
	  $(CXFX)/src/mat/v4f.cx\
	  $(CXFX)/src/mat/q4f.cx\
	  $(CXFX)/src/mat/m44f.cx\
	  $(CXFX)/src/app/application.cx\
	  $(CXFX)/src/app/event.cx\
	  $(CXFX)/src/fps/profiler.cx\
	  $(CXFX)/src/fps/framerate.cx\
	  $(CXFX)/src/gfx/batch.cx\
	  $(CXFX)/src/gfx/graphics.cx\
	  $(CXFX)/src/gfx/state.cx\
	  $(CXFX)/src/gfx/effect.cx\
	  $(CXFX)/src/gfx/shader.cx\
	  $(CXFX)/src/gfx/program.cx\
	  $(CXFX)/src/gfx/particle.cx\
	  $(CXFX)/src/gfx/mesh.cx\
	  $(CXFX)/src/gfx/gltf.cx\
	  $(CXFX)/src/gfx/model.cx\
	  $(CXFX)/src/gfx/texture.cx\
	  $(CXFX)/src/gfx/text.cx\
	  $(CXFX)/src/gfx/target.cx\
	  $(CXFX)/src/gfx/scissor.cx\
	  $(CXFX)/src/gui/callback.cx\
	  $(CXFX)/src/gui/layer.cx\
	  $(CXFX)/src/gui/skin.cx\
	  $(CXFX)/src/gui/scope.cx\
	  $(CXFX)/src/gui/font.cx\
	  $(CXFX)/src/gui/animation.cx\
	  $(CXFX)/src/gui/control.cx\
	  $(CXFX)/src/gui/label.cx\
	  $(CXFX)/src/gui/picture.cx\
	  $(CXFX)/src/gui/screen.cx\
	  $(CXFX)/src/gui/interface.cx\
	  $(CXFX)/src/gui/focus.cx\
	  $(CXFX)/src/gui/splitter.cx\
	  $(CXFX)/src/gui/window.cx\
	  $(CXFX)/src/gui/keyboard.cx\
	  $(CXFX)/src/gui/list.cx\
	  $(CXFX)/src/gui/graph.cx\
	  $(CXFX)/src/gui/lifter.cx\
	  $(CXFX)/src/gui/scroller.cx\
	  $(CXFX)/src/gui/binder.cx\
	  $(CXFX)/src/gui/combo.cx\
	  $(CXFX)/src/snd/sounds.cx\
	  $(CXFX)/src/snd/audio.cx\
	  $(CXFX)/src/snd/voice.cx\
	  $(CXFX)/src/gam/camera.cx\
	  $(CXFX)/src/gam/game.cx

0_colored_quad:
	cx $(OPTS) $(SRC) 0_colored_quad.cx ++data=$(DATA) ##++hints=resizable

1_textured_quad:
	cx $(OPTS) $(SRC) 1_textured_quad.cx ++data=$(DATA)

2_text:
	cx $(OPTS) $(SRC) 2_text.cx ++data=$(DATA)

3_perspective:
	cx $(OPTS) $(SRC) 3_perspective.cx ++data=$(DATA)

4_camera:
	cx $(OPTS) $(SRC) 4_camera.cx ++data=$(DATA)

5_batch:
	cx $(OPTS) $(SRC) 5_batch.cx ++data=$(DATA)

6_model:
	cx $(OPTS_MEM) $(SRC) 6_model.cx ++data=$(DATA)

7_menu:
	cx $(OPTS_MEM) $(SRC) 7_menu.cx ++data=$(DATA)

8_sound:
	cx $(OPTS_MEM) $(SRC) 8_sound.cx ++data=$(DATA)

9_button:
	cx $(OPTS_MEM) $(SRC) 9_button.cx ++data=$(DATA)

10_dialog:
	cx $(OPTS_MEM) $(SRC) 10_dialog.cx ++data=$(DATA)

