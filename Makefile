# Define the Java compiler
JAVAC = javac
JAVA = java
JAR = jar

# Define the source files
SOURCES = HelloWorld.java Addition.java
CLASSES = $(SOURCES:.java=.class)

# Define the JAR file name
JAR_FILE = MyProgram.jar

# Default target
all: compile run

# Compile Java files
compile: $(CLASSES)

%.class: %.java
	$(JAVAC) $<

# Create a JAR file
jar: $(CLASSES)
	echo "Main-Class: HelloWorld" > manifest.txt
	$(JAR) cfm $(JAR_FILE) manifest.txt *.class
	rm -f manifest.txt

# Run the programs sequentially
run: compile
	$(JAVA) HelloWorld
	$(JAVA) Addition

# Run the JAR file
run-jar: jar
	$(JAVA) -jar $(JAR_FILE)

# Clean up class files and JAR
clean:
	rm -f *.class $(JAR_FILE)

