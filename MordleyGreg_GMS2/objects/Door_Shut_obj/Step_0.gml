if (can.order != 0)
{
    instance_create(864, 1632, Floor2_Door_obj);
    instance_create(896, 1632, Floor2_Door_obj);
    var b = instance_create(864, 1280, Boss_obj);
    b.timeStamp[2] = current_time + 3000;
    instance_destroy();
}

