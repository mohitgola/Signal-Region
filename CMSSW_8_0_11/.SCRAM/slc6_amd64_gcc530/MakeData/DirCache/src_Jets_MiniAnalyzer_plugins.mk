ifeq ($(strip $(JetsMiniAnalyzerAuto)),)
JetsMiniAnalyzerAuto := self/src/Jets/MiniAnalyzer/plugins
PLUGINS:=yes
JetsMiniAnalyzerAuto_files := $(patsubst src/Jets/MiniAnalyzer/plugins/%,%,$(wildcard $(foreach dir,src/Jets/MiniAnalyzer/plugins ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
JetsMiniAnalyzerAuto_BuildFile    := $(WORKINGDIR)/cache/bf/src/Jets/MiniAnalyzer/plugins/BuildFile
JetsMiniAnalyzerAuto_LOC_USE := self  FWCore/Framework FWCore/PluginManager FWCore/ParameterSet DataFormats/PatCandidates DataFormats/Common
JetsMiniAnalyzerAuto_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,JetsMiniAnalyzerAuto,JetsMiniAnalyzerAuto,$(SCRAMSTORENAME_LIB),src/Jets/MiniAnalyzer/plugins))
JetsMiniAnalyzerAuto_PACKAGE := self/src/Jets/MiniAnalyzer/plugins
ALL_PRODS += JetsMiniAnalyzerAuto
Jets/MiniAnalyzer_forbigobj+=JetsMiniAnalyzerAuto
JetsMiniAnalyzerAuto_INIT_FUNC        += $$(eval $$(call Library,JetsMiniAnalyzerAuto,src/Jets/MiniAnalyzer/plugins,src_Jets_MiniAnalyzer_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
JetsMiniAnalyzerAuto_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,JetsMiniAnalyzerAuto,src/Jets/MiniAnalyzer/plugins))
endif
ALL_COMMONRULES += src_Jets_MiniAnalyzer_plugins
src_Jets_MiniAnalyzer_plugins_parent := Jets/MiniAnalyzer
src_Jets_MiniAnalyzer_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Jets_MiniAnalyzer_plugins,src/Jets/MiniAnalyzer/plugins,PLUGINS))
