/****************************************************************
 * 
 * Test module test target
 *
 ***************************************************************/

#include <testmod/testmod_config.h> 
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <inttypes.h>

int 
aim_main(int argc, char* argv[])
{
    (void)(argc);  /* COMPILER_REFERENCE */
    (void)(argv);

    printf("testmod target: no-op\n");
    testmod_config_show(&aim_pvs_stdout);
    
    return 0; 
}
