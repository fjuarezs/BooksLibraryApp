var ViewModel = function () {
    var self = this;
    self.books = ko.observableArray();
    self.booksbyAuthor = ko.observableArray();
    self.booksbyCategory = ko.observableArray();
    self.error = ko.observable();

    var booksUri = '/api/Books';

    function ajaxHelper(uri, method, data) {
        self.error(''); // Clear error message
        return $.ajax({
            type: method,
            url: uri,
            dataType: 'json',
            contentType: 'application/json',
            data: data ? JSON.stringify(data) : null
        }).fail(function (jqXHR, textStatus, errorThrown) {
            self.error(errorThrown);
        });
    }

    function getAllBooks() {
        ajaxHelper(booksUri, 'GET').done(function (data) {
            self.books(data);
        });
    }

    function getBooksbyAuthor() {
        ajaxHelper('/api/Books/byAuthor', 'GET').done(function (data) {
            self.booksbyAuthor(data);
        });
    }

    function getBooksbyCategory() {
        ajaxHelper('/api/Books/byCategory', 'GET').done(function (data) {
            self.booksbyCategory(data);
        });
    }

    // Fetch the initial data.
    getAllBooks();
    getBooksbyAuthor();
    getBooksbyCategory();
};

ko.applyBindings(new ViewModel());