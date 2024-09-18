# Makefile para compilar os arquivos EQ_CALOR_EXPL_2D
CXX = mpicxx
CXXFLAGS = -O3 -march=native -fopenmp -pthread -lm

# Nomes dos arquivos fonte
SOURCES = EQ_CALOR_EXPL_2D_BWAIT_HIBcr.cpp \
          EQ_CALOR_EXPL_2D_NAIVE_HIBcr.cpp \
          EQ_CALOR_EXPL_2D_SEM_HIBcr.cpp

# Nomes dos arquivos binários
TARGETS = EQ_CALOR_EXPL_2D_BWAIT_HIBcr \
          EQ_CALOR_EXPL_2D_NAIVE_HIBcr \
          EQ_CALOR_EXPL_2D_SEM_HIBcr

# Regra padrão
all: $(TARGETS)

# Compilação dos binários
EQ_CALOR_EXPL_2D_BWAIT_HIBcr: EQ_CALOR_EXPL_2D_BWAIT_HIBcr.cpp
	$(CXX) $(CXXFLAGS) -o $@ $^

EQ_CALOR_EXPL_2D_NAIVE_HIBcr: EQ_CALOR_EXPL_2D_NAIVE_HIBcr.cpp
	$(CXX) $(CXXFLAGS) -o $@ $^

EQ_CALOR_EXPL_2D_SEM_HIBcr: EQ_CALOR_EXPL_2D_SEM_HIBcr.cpp
	$(CXX) $(CXXFLAGS) -o $@ $^

# Limpeza dos arquivos binários e objetos
clean:
	rm -f $(TARGETS)

