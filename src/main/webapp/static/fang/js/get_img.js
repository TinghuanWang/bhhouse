// <![CDATA[

/*setup for get_img function*/
//for url
var get_img_url_start = 'http://cdn.pimg.co/',  //ex. 'http://cdn.pimg.co/'     
	get_img_url_end = '/pic.jpg';        	//ex. '/pic.jpg'

var	get_img_random_num = false, 			//true/false - allow start random pictures (numbers)
	get_img_random_max_num = 50, 			//1...n - quant of random pictures in category (numbers)
	get_img_random_mask_num = 9999, 		//99999 - index of img when start random mode in this category
	get_img_show_only_category = 'all'; 	//'all' or '' - show all categories / 'a'/'an'/../'sx'/'tr' - id of categoy ONLY allow
	

var use_img = new Array(),
	is_random_img = false;

//script generating imgs

function get_random_num() {
	return Math.floor((Math.random()*get_img_random_max_num)+1);
}

function is_array(arr) {
	var is_arr = false;
	if (typeof(arr) == 'object' && arr instanceof Array) {
		is_arr = true;
	}
	return is_arr;
}

function in_array(arr,val) {
	var in_arr = false;
    for(var i=0; i<arr.length; i++) {
        if(val == arr[i]) {
			in_arr = true;
			break;
		}    
	}
    return in_arr;
}

function check_on_already_use_img(index,category) {
	if (in_array(use_img,category+'.'+index)) {
		index = get_random_num();
		is_random_img = true;
		index = check_on_already_use_img(index,category);
	}
	return index;
}

// ]]>

