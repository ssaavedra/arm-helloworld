ENTRY(_Reset)
SECTIONS
{
	. = 0x10000;
	.startup . : { startup.o(.text) }
	.text : { *(.text) }
	.data : { *(.data) }
	.bss : { *(.bss) }
	. = . + 0x1000; /* 4kb of stack memory */
	stack_top = .;
}
