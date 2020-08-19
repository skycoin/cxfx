## options:
## TARGET=android
## PPROF=100

## TODO : can't order files alphabetically without breaking tuto 7->14

GOPATH := $(subst \,/,${GOPATH})
SKYCOIN = $(GOPATH)/src/github.com/SkycoinProject
CX = $(SKYCOIN)/cx
CXFX = .
CX_SRC := $(CX)
CXFX_SRC := $(CXFX)
GLVERSION = ++glVersion=gl32
ifeq ($(TARGET), android)
	CX_SRC = .
	CXFX_SRC = ./cxfx
	GLVERSION = ++glVersion=gles31
endif

STATE = Running
ifeq ($(PPROF),)
DEBUG = --debug-profile=0
else
DEBUG := --debug-profile=$(PPROF)
endif

OPTS = $(DEBUG)
OPTS_MEM = $(OPTS) --stack-size=128M --heap-initial=800M --heap-max=800M

DATA = ++data=$(CXFX_SRC)/resources/
GLFWHINTS = ++hints=resizable
ifeq ($FPS),)
FPS = 60
else
FPS = 30
endif

CXFXOPTS = $(GLVERSION) $(DATA) $(GLFWHINTS)

SKYLIGHT := $(CXFX_SRC)/games/skylight/src
TUTORIALS := $(CXFX_SRC)/tutorials

RUNCLI = $(OPTS_MEM) $(SRC) ${1} $(CXFXOPTS)

CX_ASSETS := $(CX)/cxgo/assets
CXFX_ASSETS := $(CX_ASSETS)/cxfx/resources

ifeq ($(TARGET), android)
	STATE = Building
	COPY_ASSETS := copy_android_assets
	COPY_TUTORIALS_ASSETS := copy_android_tutorials_assets
	COPY_SKYLIGHT_ASSETS := copy_android_skylight_assets
define runcx
	mkdir -p $(CX_ASSETS)
	@echo '$(subst $() $(),\n,${RUNCLI})' > $(CX_ASSETS)/run.cli; cd $(CX)/; $(MAKE) build-android; rm -r $(CX_ASSETS)
endef
else
ifeq ($(BUILDCX), true)
define runcx
	cd $(CX); $(MAKE) build-full
	cx $(RUNCLI)
endef
else
define runcx
	cx $(RUNCLI)
endef
endif
endif

define CXCP
	mkdir -p ${2}
	cp -R ${1} ${2}
endef

SRC = $(CX_SRC)/lib/args.cx\
	  $(CX_SRC)/lib/json.cx\
	  $(CXFX_SRC)/src/mat/math.cx\
	  $(CXFX_SRC)/src/mat/v1d.cx\
	  $(CXFX_SRC)/src/mat/v1f.cx\
	  $(CXFX_SRC)/src/mat/v2f.cx\
	  $(CXFX_SRC)/src/mat/v3f.cx\
	  $(CXFX_SRC)/src/mat/v4f.cx\
	  $(CXFX_SRC)/src/mat/q4f.cx\
	  $(CXFX_SRC)/src/mat/m44f.cx\
      $(CXFX_SRC)/src/mat/intersect.cx\
	  $(CXFX_SRC)/src/app/application.cx\
	  $(CXFX_SRC)/src/app/callback.cx\
	  $(CXFX_SRC)/src/app/event.cx\
	  $(CXFX_SRC)/src/fps/profiler.cx\
	  $(CXFX_SRC)/src/fps/framerate.cx\
	  $(CXFX_SRC)/src/gfx/batch.cx\
	  $(CXFX_SRC)/src/gfx/graphics.cx\
	  $(CXFX_SRC)/src/gfx/state.cx\
	  $(CXFX_SRC)/src/gfx/effect.cx\
	  $(CXFX_SRC)/src/gfx/shader.cx\
	  $(CXFX_SRC)/src/gfx/program.cx\
	  $(CXFX_SRC)/src/gfx/particle.cx\
	  $(CXFX_SRC)/src/gfx/mesh.cx\
	  $(CXFX_SRC)/src/gfx/gltf.cx\
	  $(CXFX_SRC)/src/gfx/model.cx\
	  $(CXFX_SRC)/src/gfx/texture.cx\
	  $(CXFX_SRC)/src/gfx/text.cx\
	  $(CXFX_SRC)/src/gfx/target.cx\
	  $(CXFX_SRC)/src/gfx/scissor.cx\
	  $(CXFX_SRC)/src/gfx/frustum.cx\
	  $(CXFX_SRC)/src/gfx/octree.cx\
	  $(CXFX_SRC)/src/gui/layer.cx\
	  $(CXFX_SRC)/src/gui/skin.cx\
	  $(CXFX_SRC)/src/gui/scope.cx\
	  $(CXFX_SRC)/src/gui/font.cx\
	  $(CXFX_SRC)/src/gui/animation.cx\
	  $(CXFX_SRC)/src/gui/control.cx\
	  $(CXFX_SRC)/src/gui/label.cx\
	  $(CXFX_SRC)/src/gui/picture.cx\
	  $(CXFX_SRC)/src/gui/screen.cx\
	  $(CXFX_SRC)/src/gui/interface.cx\
	  $(CXFX_SRC)/src/gui/focus.cx\
	  $(CXFX_SRC)/src/gui/splitter.cx\
	  $(CXFX_SRC)/src/gui/window.cx\
	  $(CXFX_SRC)/src/gui/keyboard.cx\
	  $(CXFX_SRC)/src/gui/list.cx\
	  $(CXFX_SRC)/src/gui/graph.cx\
	  $(CXFX_SRC)/src/gui/lifter.cx\
	  $(CXFX_SRC)/src/gui/scroller.cx\
	  $(CXFX_SRC)/src/gui/binder.cx\
	  $(CXFX_SRC)/src/gui/combo.cx\
	  $(CXFX_SRC)/src/snd/sounds.cx\
	  $(CXFX_SRC)/src/snd/audio.cx\
	  $(CXFX_SRC)/src/snd/voice.cx\
	  $(CXFX_SRC)/src/gam/camera.cx\
	  $(CXFX_SRC)/src/phx/physics.cx

.PHONY:all
all:skylight

.PHONY:copy_android_assets
copy_android_assets:
	$(call CXCP, $(CXFX)/resources/audios/, $(CXFX_ASSETS)/audios/)
	$(call CXCP, $(CXFX)/resources/fonts/, $(CXFX_ASSETS)/fonts/)
	$(call CXCP, $(CXFX)/resources/shaders/, $(CXFX_ASSETS)/shaders/)
	$(call CXCP, $(CXFX)/resources/textures/, $(CXFX_ASSETS)/textures/)
	$(call CXCP, $(CXFX)/src/, $(CX_ASSETS)/cxfx/src/)
	$(call CXCP, $(CX)/lib/, $(CX_ASSETS)/lib/)

.PHONY:copy_android_tutorials_assets
copy_android_tutorials_assets: $(COPY_ASSETS)
	$(call CXCP, $(CXFX)/resources/models/glTF-Sample-Models/DamagedHelmet/, $(CXFX_ASSETS)/models/glTF-Sample-Models/DamagedHelmet/)
	$(call CXCP, $(CXFX)/tutorials/, $(CX_ASSETS)/cxfx/tutorials/)

.PHONY:copy_android_skylight_assets
copy_android_skylight_assets: $(COPY_ASSETS)
	$(call CXCP, $(CXFX)/resources/models/skylight/, $(CXFX_ASSETS)/models/skylight/)
	$(call CXCP, $(CXFX)/games/skylight/src/, $(CX_ASSETS)/cxfx/games/skylight/src/)

.PHONY:tuto0
tuto0: $(COPY_TUTORIALS_ASSETS)
	@echo $(STATE) colored quad tutorial...
	$(call runcx,$(TUTORIALS)/0_colored_quad.cx)

.PHONY:tuto1
tuto1: $(COPY_TUTORIALS_ASSETS)
	@echo $(STATE) textured quad tutorial...
	$(call runcx,$(TUTORIALS)/1_textured_quad.cx)

.PHONY:tuto2
tuto2: $(COPY_TUTORIALS_ASSETS)
	@echo $(STATE) text tutorial...
	$(call runcx,$(TUTORIALS)/2_text.cx)

.PHONY:tuto3
tuto3: $(COPY_TUTORIALS_ASSETS)
	@echo $(STATE) perspective tutorial...
	$(call runcx,$(TUTORIALS)/3_perspective.cx)

.PHONY:tuto4
tuto4: $(COPY_TUTORIALS_ASSETS)
	@echo $(STATE) camera tutorial...
	$(call runcx,$(TUTORIALS)/4_camera.cx)

.PHONY:tuto5
tuto5: $(COPY_TUTORIALS_ASSETS)
	@echo $(STATE) batch tutorial...
	$(call runcx,$(TUTORIALS)/5_batch.cx)

.PHONY:tuto6
tuto6: $(COPY_TUTORIALS_ASSETS)
	@echo $(STATE) model tutorial...
	$(call runcx,$(TUTORIALS)/6_model.cx)

.PHONY:tuto7
tuto7: $(COPY_TUTORIALS_ASSETS)
	@echo $(STATE) menu tutorial...
	$(call runcx,$(TUTORIALS)/7_menu.cx)

.PHONY:tuto8
tuto8: $(COPY_TUTORIALS_ASSETS)
	@echo $(STATE) sound tutorial...
	$(call runcx,$(TUTORIALS)/8_sound.cx)

.PHONY:tuto9
tuto9: $(COPY_TUTORIALS_ASSETS)
	@echo $(STATE) button tutorial...
	$(call runcx,$(TUTORIALS)/9_button.cx)

.PHONY:tuto10
tuto10: $(COPY_TUTORIALS_ASSETS)
	@echo $(STATE) dialog tutorial...
	$(call runcx,$(TUTORIALS)/10_dialog.cx)

.PHONY:tuto11
tuto11: $(COPY_TUTORIALS_ASSETS)
	@echo $(STATE) octree tutorial...
	$(call runcx,$(TUTORIALS)/11_octree.cx)

.PHONY:skylight
skylight: $(COPY_SKYLIGHT_ASSETS)
	@echo $(STATE) skylight...
	$(call runcx, $(SKYLIGHT)/menu.cx $(SKYLIGHT)/skylight.cx ++gmode=$(GMODE) ++fps=$(FPS))

