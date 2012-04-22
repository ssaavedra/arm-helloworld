.global _Reset
_Reset:
	B _Reset_handler /* Reset */
	B . /* Undef */
	B . /* SWI */
	B . 
	B .
	B .
	B .
	B .

_Reset_handler:
	LDR sp, =stack_top
	BL c_entry
	B .

