ALL_SUBSYSTEMS+=MetScanning-1
subdirs_src_MetScanning-1 = src_MetScanning-1_skim src_MetScanning-1_tuple
ALL_PACKAGES += MetScanning-1/skim
subdirs_src_MetScanning-1_skim := src_MetScanning-1_skim_python src_MetScanning-1_skim_test
ifeq ($(strip $(PyMetScanning-1skim)),)
PyMetScanning-1skim := self/src/MetScanning-1/skim/python
src_MetScanning-1_skim_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/MetScanning-1/skim/python)
PyMetScanning-1skim_files := $(patsubst src/MetScanning-1/skim/python/%,%,$(wildcard $(foreach dir,src/MetScanning-1/skim/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyMetScanning-1skim_LOC_USE := self  
PyMetScanning-1skim_PACKAGE := self/src/MetScanning-1/skim/python
ALL_PRODS += PyMetScanning-1skim
PyMetScanning-1skim_INIT_FUNC        += $$(eval $$(call PythonProduct,PyMetScanning-1skim,src/MetScanning-1/skim/python,src_MetScanning-1_skim_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyMetScanning-1skim,src/MetScanning-1/skim/python))
endif
ALL_COMMONRULES += src_MetScanning-1_skim_python
src_MetScanning-1_skim_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_MetScanning-1_skim_python,src/MetScanning-1/skim/python,PYTHON))
ALL_COMMONRULES += src_MetScanning-1_skim_test
src_MetScanning-1_skim_test_parent := MetScanning-1/skim
src_MetScanning-1_skim_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_MetScanning-1_skim_test,src/MetScanning-1/skim/test,TEST))
ALL_PACKAGES += MetScanning-1/tuple
subdirs_src_MetScanning-1_tuple := src_MetScanning-1_tuple_test
ifeq ($(strip $(METScanningNutpleMaker)),)
METScanningNutpleMaker := self/src/MetScanning-1/tuple/test
METScanningNutpleMaker_files := $(patsubst src/MetScanning-1/tuple/test/%,%,$(foreach file,METScanningNtupleMaker.cc,$(eval xfile:=$(wildcard src/MetScanning-1/tuple/test/$(file)))$(if $(xfile),$(xfile),$(warning No such file exists: src/MetScanning-1/tuple/test/$(file). Please fix src/MetScanning-1/tuple/test/BuildFile.))))
METScanningNutpleMaker_BuildFile    := $(WORKINGDIR)/cache/bf/src/MetScanning-1/tuple/test/BuildFile
METScanningNutpleMaker_LOC_USE := self  DataFormats/METReco DataFormats/ParticleFlowReco FWCore/Framework FWCore/MessageLogger FWCore/ParameterSet FWCore/Utilities RecoLocalCalo/EcalRecAlgos
METScanningNutpleMaker_PRE_INIT_FUNC += $$(eval $$(call edmPlugin,METScanningNutpleMaker,METScanningNutpleMaker,$(SCRAMSTORENAME_LIB),src/MetScanning-1/tuple/test))
METScanningNutpleMaker_PACKAGE := self/src/MetScanning-1/tuple/test
ALL_PRODS += METScanningNutpleMaker
METScanningNutpleMaker_INIT_FUNC        += $$(eval $$(call Library,METScanningNutpleMaker,src/MetScanning-1/tuple/test,src_MetScanning-1_tuple_test,$(SCRAMSTORENAME_BIN),,$(SCRAMSTORENAME_LIB),$(SCRAMSTORENAME_LOGS)))
METScanningNutpleMaker_CLASS := TEST_LIBRARY
else
$(eval $(call MultipleWarningMsg,METScanningNutpleMaker,src/MetScanning-1/tuple/test))
endif
ALL_COMMONRULES += src_MetScanning-1_tuple_test
src_MetScanning-1_tuple_test_parent := MetScanning-1/tuple
src_MetScanning-1_tuple_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_MetScanning-1_tuple_test,src/MetScanning-1/tuple/test,TEST))
ALL_SUBSYSTEMS+=RecoMET
subdirs_src_RecoMET = src_RecoMET_METFilters
ALL_PACKAGES += RecoMET/METFilters
subdirs_src_RecoMET_METFilters := src_RecoMET_METFilters_plugins src_RecoMET_METFilters_python src_RecoMET_METFilters_test
ifeq ($(strip $(PyRecoMETMETFilters)),)
PyRecoMETMETFilters := self/src/RecoMET/METFilters/python
src_RecoMET_METFilters_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/RecoMET/METFilters/python)
PyRecoMETMETFilters_files := $(patsubst src/RecoMET/METFilters/python/%,%,$(wildcard $(foreach dir,src/RecoMET/METFilters/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyRecoMETMETFilters_LOC_USE := self  
PyRecoMETMETFilters_PACKAGE := self/src/RecoMET/METFilters/python
ALL_PRODS += PyRecoMETMETFilters
PyRecoMETMETFilters_INIT_FUNC        += $$(eval $$(call PythonProduct,PyRecoMETMETFilters,src/RecoMET/METFilters/python,src_RecoMET_METFilters_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyRecoMETMETFilters,src/RecoMET/METFilters/python))
endif
ALL_COMMONRULES += src_RecoMET_METFilters_python
src_RecoMET_METFilters_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoMET_METFilters_python,src/RecoMET/METFilters/python,PYTHON))
ALL_COMMONRULES += src_RecoMET_METFilters_test
src_RecoMET_METFilters_test_parent := RecoMET/METFilters
src_RecoMET_METFilters_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_RecoMET_METFilters_test,src/RecoMET/METFilters/test,TEST))
ALL_SUBSYSTEMS+=Jets
subdirs_src_Jets = src_Jets_MiniAnalyzer
ALL_PACKAGES += Jets/MiniAnalyzer
subdirs_src_Jets_MiniAnalyzer := src_Jets_MiniAnalyzer_plugins src_Jets_MiniAnalyzer_python src_Jets_MiniAnalyzer_test src_Jets_MiniAnalyzer_doc
ifeq ($(strip $(PyJetsMiniAnalyzer)),)
PyJetsMiniAnalyzer := self/src/Jets/MiniAnalyzer/python
src_Jets_MiniAnalyzer_python_parent := 
ALL_PYTHON_DIRS += $(patsubst src/%,%,src/Jets/MiniAnalyzer/python)
PyJetsMiniAnalyzer_files := $(patsubst src/Jets/MiniAnalyzer/python/%,%,$(wildcard $(foreach dir,src/Jets/MiniAnalyzer/python ,$(foreach ext,$(SRC_FILES_SUFFIXES),$(dir)/*.$(ext)))))
PyJetsMiniAnalyzer_LOC_USE := self  
PyJetsMiniAnalyzer_PACKAGE := self/src/Jets/MiniAnalyzer/python
ALL_PRODS += PyJetsMiniAnalyzer
PyJetsMiniAnalyzer_INIT_FUNC        += $$(eval $$(call PythonProduct,PyJetsMiniAnalyzer,src/Jets/MiniAnalyzer/python,src_Jets_MiniAnalyzer_python,1,1,$(SCRAMSTORENAME_PYTHON),$(SCRAMSTORENAME_LIB),,))
else
$(eval $(call MultipleWarningMsg,PyJetsMiniAnalyzer,src/Jets/MiniAnalyzer/python))
endif
ALL_COMMONRULES += src_Jets_MiniAnalyzer_python
src_Jets_MiniAnalyzer_python_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Jets_MiniAnalyzer_python,src/Jets/MiniAnalyzer/python,PYTHON))
ALL_COMMONRULES += src_Jets_MiniAnalyzer_test
src_Jets_MiniAnalyzer_test_parent := Jets/MiniAnalyzer
src_Jets_MiniAnalyzer_test_INIT_FUNC += $$(eval $$(call CommonProductRules,src_Jets_MiniAnalyzer_test,src/Jets/MiniAnalyzer/test,TEST))
