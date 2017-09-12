pragma solidity ^0.4.16;


contract Fibonacci {
	mapping(uint => uint) fibs;
	event Calculated(uint position, uint result);

	function calculate(uint position) returns (uint result) {
		if (position <= 1) {
			return position;
		}

		if (fibs[position] != 0) {
	        return fibs[position];
	    }

		uint i = 1;
		uint last = 0;
		result = 1;

		while (i < position) {
			uint next = last + result;
			last = result;
			result = next;
			i++;
		}

		fibs[position] = result;
		Calculated(position, result);
		return result;
	}

	/* Add a fallback function to prevent contract payability and non-existent function calls */
}
