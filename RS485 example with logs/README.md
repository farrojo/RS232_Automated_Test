# RS485 example with logs

This example is quite wider than other, here, we can see interaction from batch calling docklight script execution, creating a log file based on test parameters, and finally activatting windows voice engine, in order to notify the operator of any news about the process.

In this example, the main device interacts with the second device through the RS485 communication port, which is used through an RS232-RS485 converter. The control of ports, power on, and interruption of lines A and B of RS485 is done through a relay card controlled by the script, a  command line project for Arduino can be found here.

As a prerequisite, the Windows system must have the Windows engine installed, and some voice activated. The script will be in charge of overwriting in *```_error_log.txt```* the novelty that prevents the complete execution of the test, the script will terminate the execution, and the bat file proceeds to the execution of the script that performs the reading, as result, the operator is notified of the news, and the failure record remains in the result file (where the results of all the tests are located).