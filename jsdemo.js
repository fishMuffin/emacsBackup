function add(arg02) {
    var a=arg02;
    var b=2;
    var sum=a+b;
}

var obj={
    myconcat: function () {
	var s1="hello"
	var s2="world"
	var s3=s1=s2
    },

    fun1:function(){
	this.myconcat();
    },

    fun2:function(){

	 add(1);
    }

}
