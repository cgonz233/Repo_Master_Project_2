global key
InitKeyboard();

forwardSpeed = 100;
turnSpeed = 50;

brick.SetColorMode(3, 2);

v = brick.GetBattVoltage();
disp(v)

while true
    pause(0.01)

    touch = brick.TouchPressed(1) && brick.TouchPressed(2);
    if touch
        brick.playTone(100,1000,10);
    end    

    color = brick.ColorCode(3);
    if color == 5
        speedCap = 66;
    elseif color == 4
        speedCap = 33;
    else
        speedCap = 100;
    end


    if key == 0
        brick.StopAllMotors();
        continue
    end
   
    pause(0.1);
    switch key
        case 'w'
            disp('Up Arrow Pressed!');
            brick.MoveMotor('AB', min(forwardSpeed, speedCap));
        case 's'
            disp('Down Arrow Pressed!');
            brick.MoveMotor('AB', -0.33 * min(forwardSpeed, speedCap));
            brick.playTone(100, 1000, 10);
        case 'a'
            disp('Left Arrow Pressed!');
            brick.MoveMotor('A', turnSpeed);
            brick.MoveMotor('B', 0.5 * turnSpeed);
        case 'd'
            disp('Right Arrow Pressed!');
            brick.MoveMotor('A', 0.5 * turnSpeed);
            brick.MoveMotor('B', turnSpeed);
        case 'q'
            disp('Stopping.')
            DisconnectBrick(brick);
            clear brick
            break
    end
end

CloseKeyboard();