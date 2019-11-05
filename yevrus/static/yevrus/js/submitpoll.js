function myfunc() {
    var form = $("#formsubmit");
    $.ajax({
        type: form.attr('method'), // GET or POST
        url: form.attr('action'), // the file to call
        data: form.serialize(), // get the form data
    });
    return false;
}