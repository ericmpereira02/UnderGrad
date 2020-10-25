// Author: Eric Pereira, epereira2015@my.fit.edu
// Course: CSE 4250, Fall 2018
// Project: Project #2, The Flinstone Virtual Machine

package main

import (
	"bufio"
	"reflect"
	//"bytes"
	//"encoding/binary"
	"fmt"
	"os"
)

func main() {
	input := bufio.NewScanner(os.Stdin)
	var REGISTERS = []int{0, 0, 0, 0, 0, 0, 0, 0}
	REGISTERS[1] = 0
	var length int = 8
	for input.Scan() {
		
		for ii=0;ii<length;ii++ {

		}
		someBytes := input.Bytes()
		//fmt.Print("%s", someTest)
		for index, element := range someBytes {
			//fmt.Print("Hello world")
			fmt.Println("BYTE: %d %s %x", index, reflect.TypeOf(element), element)
			//fmt.Println()
			instruction(element, index, REGISTERS)
			fmt.Println()
		}
		//someTest = "HELLO"
	}
	output(REGISTERS)
}

func instruction(instr uint8, index int, REGISTERS []int, input ) {
	var length int

	switch instr {
	//Loads value into assigned register
	case 0x00:
		length = 6
		fmt.Print("LOAD ")
		REGISTERS[returnRegisters(input.Bytes())] = input.Bytes()

	//Loads value of first register into second register
	case 0x01:
		length = 3
		fmt.Print("RLOAD ")

	//Pushes value to the stack
	case 0x02:
		length = 3
		fmt.Print("PUSH ")

	//Pops value from top of stack and stores in register
	case 0x03:
		length = 2
		fmt.Print("POP ")

	//adds values in the last two registers and puts it in first
	case 0x04:
		length = 4
		fmt.Print("ADD ")

	//sub values in lasty two registers stated and puts it in first stated
	case 0x05:
		length = 4
		fmt.Print("SUB ")

	//same as add but with multiplication
	case 0x06:
		length = 4
		fmt.Print("MUL ")

	//same as add but with divison
	case 0x07:
		length = 4
		fmt.Print("DIV ")

		//jmp commmand, aka a goto
	case 0x08:
		length = 5
		fmt.Print("JMP ")
		//cmp, sets condition code for future branch
	case 0x09:
		length = 3
		fmt.Print("CMP ")
		//BLT less tha
	case 0x0a:
		length = 5
		fmt.Print("BEQ ")
		//BEQ equal to
	case 0x0b:
		length = 5
		fmt.Print("BGT ")
		//BGT greater than
	case 0x0c:
		length = 5
		fmt.Print("BNE ")
		//BNE not equal command
	case 0x0d:
		length = 5
	}
	length += 12

	return
}

func returnRegisters(register uint8) int {
	switch register {
	case 0x00:
		return 1
	case 0x01:
		return 2
	case 0x02:
		return 3
	case 0x03:
		return 4
	case 0x04:
		return 5
	case 0x05:
		return 6
	case 0x06:
		return 7
	case 0x07:
		return 8
	}
	return 0
}

func checkError(Instr byte, checkVal int) {
	var someError string
	if Instr == 0x02 && checkVal >= 1000 {
		someError = "full stack"
	} else if Instr == 0x03 && checkVal <= 0 {
		someError = "empty stack"
	} else if Instr == 0x07 && checkVal == 0 {
		someError = "division by zero"
	}
	errorOutput(someError)
}

//outputs error message
func errorOutput(someError string) {
	fmt.Println("ERROR: %s", someError)
}

//outputs all 8 registers at the end of the program
func output(REGISTERS []int) {
	fmt.Print("(")
	for i := 0; i < 8; i++ {
		fmt.Print("%d,", REGISTERS[i])
	}
	fmt.Print(")")
	fmt.Println()
	return
}
