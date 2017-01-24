ifeq ($(strip $(METFilters_plugins)),)
METFilters_plugins := self/src/RecoMET/METFilters/plugins
PLUGINS:=yes
METFilters_plugins_files := $(patsubst src/RecoMET/METFilters/plugins/%,%,$(foreach file,*.cc,$(eval xfile:=$(wildcard src/RecoMET/METFilters/plugins/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/RecoMET/METFilters/plugins/$(file). Please fix src/RecoMET/METFilters/plugins/BuildFile.))))
METFilters_plugins_BuildFile    := $(WORKINGDIR)/cache/bf/src/RecoMET/METFilters/plugins/BuildFile
METFilters_plugins_LOC_USE := self  FWCore/Framework FWCore/ServiceRegistry FWCore/PluginManager FWCore/ParameterSet DataFormats/EcalRecHit DataFormats/EcalDetId Geometry/CaloTopology Geometry/CaloGeometry Geometry/Records CalibCalorimetry/EcalTPGTools CondFormats/EcalObjects DataFormats/PatCandidates DataFormats/ParticleFlowCandidate RecoParticleFlow/PFProducer DataFormats/ParticleFlowReco DataFormats/DetId CondFormats/DataRecord CommonTools/UtilAlgos CondFormats/HcalObjects DataFormats/HcalDetId DataFormats/HcalRecHit DataFormats/EgammaCandidates DataFormats/EgammaReco DataFormats/StdDictionaries DataFormats/WrappedStdDictionaries RecoJets/JetAlgorithms RecoJets/JetProducers RecoMET/METAlgorithms root
METFilters_plugins_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,METFilters_plugins,METFilters_plugins,$(SCRAMSTORENAME_LIB),src/RecoMET/METFilters/plugins))
METFilters_plugins_PACKAGE := self/src/RecoMET/METFilters/plugins
ALL_PRODS += METFilters_plugins
RecoMET/METFilters_forbigobj+=METFilters_plugins
METFilters_plugins_INIT_FUNC        += $$(eval $$(call Library,METFilters_plugins,src/RecoMET/METFilters/plugins,src_RecoMET_METFilters_plugins,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
METFilters_plugins_CLASS := LIBRARY
else
$(eval $(call MultipleWarningMsg,METFilters_plugins,src/RecoMET/METFilters/plugins))
endif
ALL_COMMONRULES += src_RecoMET_METFilters_plugins
src_RecoMET_METFilters_plugins_parent := RecoMET/METFilters
src_RecoMET_METFilters_plugins_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoMET_METFilters_plugins,src/RecoMET/METFilters/plugins,PLUGINS))
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
