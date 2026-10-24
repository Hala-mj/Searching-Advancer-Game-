# Build on Linux (freeglut + GLEW) or macOS (GLUT/OpenGL frameworks).
#   Linux deps (Debian/Ubuntu): sudo apt install g++ freeglut3-dev libglew-dev
#   Run from the repository root so assets/floor-texture.bmp is found.

TARGET := searching-advancer-game
SRC    := CG-Project/main.cpp
UNAME  := $(shell uname -s)

ifeq ($(UNAME),Darwin)
  LIBS := -framework OpenGL -framework GLUT
else
  LIBS := -lglut -lGLEW -lGLU -lGL
endif

$(TARGET): $(SRC)
	$(CXX) -O2 -o $@ $(SRC) $(LIBS)

run: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(TARGET)

.PHONY: run clean
