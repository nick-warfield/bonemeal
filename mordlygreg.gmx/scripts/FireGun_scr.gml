//gun code here
show_debug_message("bang");

bulletInst = instance_create(x, y, bullet_obj);
with(bulletInst)
{
    speed = 5;
    image_angle = player2_obj.direction;
    direction = player2_obj.direction;
}
