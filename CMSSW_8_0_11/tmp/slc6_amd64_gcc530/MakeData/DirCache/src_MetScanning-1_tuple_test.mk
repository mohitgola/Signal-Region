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
