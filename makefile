# Variables
CXX = g++
CXXFLAGS = -I/usr/include/eigen3/ -Iinclude -Wall -Wextra -std=c++11
SRCDIR = src
INCDIR = include
OBJDIR = obj
BINDIR = bin
TARGET = gan

# Trouver tous les fichiers sources et créer les fichiers objets correspondants
SOURCES = $(wildcard $(SRCDIR)/*.cpp) main.cpp
OBJECTS = $(patsubst %.cpp,$(OBJDIR)/%.o,$(notdir $(SOURCES)))

# Cible par défaut
all: $(BINDIR)/$(TARGET)

# Règle pour créer les fichiers objets
$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJDIR)/main.o: main.cpp
	$(CXX) $(CXXFLAGS) -c main.cpp -o $@

# Edition de lien
$(BINDIR)/$(TARGET): $(OBJECTS)
	@mkdir -p $(BINDIR)
	$(CXX) $(OBJECTS) -o $(BINDIR)/$(TARGET)

# Nettoyage des fichiers objets et de l'exécutable
clean:
	rm -rf $(OBJDIR)/*.o $(BINDIR)/$(TARGET)

# Création du répertoire obj
$(OBJECTS): | $(OBJDIR)

$(OBJDIR):
	mkdir -p $(OBJDIR)



#generer depuis ChatGPT