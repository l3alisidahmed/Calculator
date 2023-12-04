# Calculator
Syntax Checker
This program is a simple syntax checker implemented using Lex (Flex) for lexical analysis. It checks the syntax of a specific language defined by the provided regular expressions.

# Usage
## Compilation:

### Compile the program using a C compiler. For example:
```flex syntax_checker.l
gcc lex.yy.c -o syntax_checker -ll

# Execution:
## Run the compiled program:

./syntax_checker
The program will prompt you to enter the name of the file to be checked.

# Input File Format
The syntax checker expects an input file containing expressions written in a specific language. The language's syntax is defined by the regular expressions in the Lex (Flex) specification.

# Output
The program will generate an output file (output.txt) containing information about the validity of the expressions. Valid expressions will be marked with "✅", and syntax errors will be reported with corresponding row and column information.

# Syntax Errors
The Errors function in the code is responsible for detecting syntax errors. It checks for invalid operator sequences, mismatched parentheses, and other potential syntax issues.

# Example
An example input file (input.txt) and its corresponding output file (output.txt) are provided for reference.

# Notes
Ensure that you have Flex and a C compiler installed on your system before compiling and running the program.

The regular expressions in the Lex (Flex) specification define the accepted syntax. Modify them as needed for your specific language.