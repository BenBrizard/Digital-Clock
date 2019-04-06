# Digital-Clock
At the core of this project resides a simple programmable clock, relying on cascading BCD counters. From there, an SPI master communicates with an OLED controller, namely the SSD1306. The VHDL description includes the initialization process to power up the OLED display. Then, the SPI transactions are specifically use to transfer data from the clock to the OLED display. 

The FPGA used in this project is the Artix-7 XC7A200T, from Xilinx.
The complete description of the project is presented in the file named "ELE3311 Énoncé Projet 3 - Hiver 2019".

# FSM Flow Chart

![alt text](images/msa.jpg?raw=true "fsm")

# Behavioral simulations

# spi_master

![alt text](images/simulation_comportementale_maitre_SPI.PNG)


# cmd_addr

![alt text](images/simulation_comportementale_compteur_adresse.PNG)

# delay_cnt

![alt text](images/simulation_comportementale_compteur_delai.PNG)

# display_fsm

![alt text](images/simulation_comportementale_display_FSM_transition.PNG)

# horloge_OLED

![alt text](images/simulation_comportementale_display_OLED_data.PNG)

