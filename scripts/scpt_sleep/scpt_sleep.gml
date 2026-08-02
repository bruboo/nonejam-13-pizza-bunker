///@function scpt_sleep(_ms)
function scpt_sleep(ms) {
    var t = current_time + ms;
    while (current_time < t) {};
}