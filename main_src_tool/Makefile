.PHONY: all clean 

CC 		   =	gcc
CXX 	   =	g++

CXXFLAGS   =	-std=c++11\
				-I../\


LD_FLAGS   =    -L../minimap2\
				-lz\
				-lminimap2\
				-lpthread\


DEUBG_CXX  =	${CXXFLAGS} -g
RELEASE_CXX=	${CXXFLAGS}

source_cpp =	../common/files/file_reader.cpp \
		   		../biocommon/sam_bam/sam_parser.cpp\
		   		../biocommon/pair/pair_sam_parser.cpp\
				../biocommon/fasta/fasta.cpp\
				../biocommon/fastq/fastq.cpp\
				../biocommon/seq/seq.cpp\
				../biocommon/paf/PAF.cpp\
                ../biocommon/align_common/align_result.cpp\
		   		../common/files/file_writer.cpp \
		   		../common/files/gzstream.cpp \
				../common/log/log.cpp\
				../common/log/logfilter.cpp\
				../common/time/timetools.cpp\
				../common/string/stringtools.cpp\
                ../appcommon/contigPairInfo.cpp\
                ../appcommon/ScaffInfo.cpp\
                ../appcommon/ONT2Gap.cpp\
				../common/args/argsparser.cpp\


source_o		= ${source_cpp:%.cpp=%.o}

.cpp.o:
	${CXX} ${DEUBG_CXX} -c $< -o $@

jobs =      FakeRef2Scaff       ExtractFakeFill       Contig100K       Ref2Gap 

scripts=

all :  ${jobs} ${scripts}






FakeRef2Scaff_cpp = FakeRef2Scaff.cpp
FakeRef2Scaff_o = FakeRef2Scaff.o
FakeRef2Scaff : clean ${FakeRef2Scaff_o} ${source_o} ../tool
	${CXX} ${FakeRef2Scaff_o} ${source_o} ${LD_FLAGS} ${DEUBG_CXX} -o FakeRef2Scaff
	mv $@ ../tool/




ExtractFakeFill_cpp = ExtractFakeFill.cpp
ExtractFakeFill_o = ExtractFakeFill.o
ExtractFakeFill : clean ${ExtractFakeFill_o} ${source_o} ../tool
	${CXX} ${ExtractFakeFill_o} ${source_o} ${LD_FLAGS} ${DEUBG_CXX} -o ExtractFakeFill
	mv $@ ../tool/




Contig100K_cpp = Contig100K.cpp
Contig100K_o = Contig100K.o
Contig100K : clean ${Contig100K_o} ${source_o} ../tool
	${CXX} ${Contig100K_o} ${source_o} ${LD_FLAGS} ${DEUBG_CXX} -o Contig100K
	mv $@ ../tool/




Ref2Gap_cpp = Ref2Gap.cpp
Ref2Gap_o = Ref2Gap.o
Ref2Gap : clean ${Ref2Gap_o} ${source_o} ../tool
	${CXX} ${Ref2Gap_o} ${source_o} ${LD_FLAGS} ${DEUBG_CXX} -o Ref2Gap
	mv $@ ../tool/


jobs_o=  ${FakeRef2Scaff_o} ${ExtractFakeFill_o} ${Contig100K_o} ${Ref2Gap_o}

dirty	   =${jobs_o} ${jobs} ${source_o}

../tool:
	mkdir -p ../tool

clean:
	rm -rf ${dirty}

