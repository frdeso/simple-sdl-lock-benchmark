CC = clang
CXX = clang++ -std=c++11 #-stdlib=libc++
DEBUG_FLAGS = -O0 -g3 

ERROR_FLAGS =
ERROR_FLAGS += -Wall -Wextra -Werror -pedantic -pedantic-errors
ERROR_FLAGS += -Wcast-qual -Wpointer-arith # -Wshadow
ERROR_FLAGS += -Winit-self -Wfloat-equal # -Wconversion
ERROR_FLAGS += -Wuninitialized -Wsometimes-uninitialized
ERROR_FLAGS += -Wmissing-declarations -Wwrite-strings
ERROR_FLAGS += -fstrict-aliasing -Wstrict-aliasing=2 -Wstrict-overflow=2
ERROR_FLAGS += -Wcast-align -Wredundant-decls -Wvolatile-register-var
ERROR_FLAGS += -Wstack-protector #-Wframe-larger-than=4096
ERROR_FLAGS += -Wno-unused-parameter -Wno-cast-align -Wno-gnu-zero-variadic-macro-arguments

INCLUDE_FLAGS := -isystem /usr/include/SDL
CXXFLAGS := $(SDL_CFLAGS) $(INCLUDE_FLAGS) $(ERROR_FLAGS) $(DEBUG_FLAGS)
SDL_LDFLAGS := $(shell sdl-config --libs)


all:
	$(CXX) -o sdl_lock_bt main.cpp $(SDL_LDFLAGS) $(CXXFLAGS)
	
clean:
	rm sdl_lock_bt
