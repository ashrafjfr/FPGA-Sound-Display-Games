# FPGA-Sound-Display-and-Games

In this project, my project partner and I had to programme an FPGA board using Verilog. The main task was to create an sound display visualiser. We were given a microphone and LED display to be connected to the FPGA board. Whenever the microphone detects a sound, it will display the volume of the sound via the small LEDs over the switches. The connected LED Display can also be switched on to display a better visualisation of the volume level. The seven segment display on the left of the board will also display the volume level.

Here is our working sound display with the volume bar.

<p align="center">
  <img src="https://github.com/ashrafjfr/FPGA-Sound-Display-and-Games/blob/main/FPGA_pics/sound_display.png" width="700" height="400">
</p>

Apart from the main task, we were given the freedom to create our own improvements and games to further show our understanding of Verilog, using the FPGA board and designing digital systems. For my individual work, I made a volume wave indicator that is able to display the changing volume levels to form a sound wave using volume bars. 

<p align="center">
  <img src="https://github.com/ashrafjfr/FPGA-Sound-Display-and-Games/blob/main/FPGA_pics/vol_wave.png" width="300" height="230">
</p>

Secondly, I made a simple volume detector with a Pikachu mask visualisation. As the volume gets louder, or when a user blows into the mask, Pikachu gradually wears a full mask (so that it does not catch a virus when someone blows into his face >.<). 

<p align="center">
  <img src="https://github.com/ashrafjfr/FPGA-Sound-Display-and-Games/blob/main/FPGA_pics/pika_mask_open.png" width="300" height="230"> <img src="https://github.com/ashrafjfr/FPGA-Sound-Display-and-Games/blob/main/FPGA_pics/pika_mask.png" width="300" height="230">
</p>

Last but not least, I made basketball game for 2 players. To score a point, a user must blow into the mic to lift the ball up and use the buttons on the FPGA to control the ball's movement. The user then stops blowing into the mic when the ball is above the hoop so that it can fall into the hoop to score a point.

<p align="center">
  <img src="https://github.com/ashrafjfr/FPGA-Sound-Display-and-Games/blob/main/FPGA_pics/bball.png" width="300" height="230">
</p>

For our final team item, we made a single and multiplayer ping pong game. A switch is used to determine whether player would like to play against the AI or against another player. Player will then use the buttons on the FPGA board to control the paddle. The scores for each player and AI will be displayed on the seven segment display and players can play up to 10 points. There are 3 levels of ball speed in both player modes and players can select the mode by making a loud sound to the mic, such as by snapping their fingers. The levels are indicated by the background colour, green, yellow, red, in order of slowest ball speed to fastest.

<p align="center">
  <img src="https://github.com/ashrafjfr/FPGA-Sound-Display-and-Games/blob/main/FPGA_pics/ping_pong.jpg" width="400" height="230"> <img src="https://github.com/ashrafjfr/FPGA-Sound-Display-and-Games/blob/main/FPGA_pics/ping_pong_closeup.png" width="300" height="230">
</p>

To find out more details about each feature or game, feel free to read our instruction manual / report [here](https://github.com/ashrafjfr/FPGA-Sound-Display-and-Games/blob/main/FPGA_Sound_Display_and_Games_Report.pdf)!

Thanks for reading!
