global brick forwardSpeed turnSpeed
disp(brick)
brick = evalin('base', 'brick');

forwardSpeed = 100;
turnSpeed = 50;

f = figure('KeyPressFcn', @keyControl, 'KeyReleaseFcn', @keyRelease);
disp('Click the figure and use WASD to move, Q to stop. Press ESC or close figure to quit.');

function keyControl(~, event)
    global brick forwardSpeed turnSpeed

    switch event.Key
        case 'w'
            brick.MoveMotor('AB', forwardSpeed);
        case 's'
            brick.MoveMotor('AB', 0.33 * -forwardSpeed);
            brick.beep(5000, 300);
            brick.beep();
        case 'd'
            brick.MoveMotor('A', 0.5 * turnSpeed);
            brick.MoveMotor('B', turnSpeed);
        case 'a'
            brick.MoveMotor('A', turnSpeed);
            brick.MoveMotor('B', 0.5 * turnSpeed);
        case 'q' 
            brick.StopAllMotors();
    end
end

function keyRelease(~, ~)
    global brick
    brick.StopAllMotors();
end

function checkTouchSensor(~, ~)
    global brick
    if brick.TouchPressed(1) || brick.TouchPressed(2)
        disp('Touch sensor pressed. Stopping motors.');
        brick.StopAllMotors();
    end
end
