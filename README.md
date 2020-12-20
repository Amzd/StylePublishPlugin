# StylePublishPlugin

Easily add a little bit of CSS to a page without writing html and using the style attribute.


Example:

    ```style
    table {
        table-layout: fixed !important;
    }
    ```

Will get converted to

```html
<link rel="stylesheet" href="data:text/css,table%20%7B%0A%20%20%20%20table%2Dlayout%3A%20fixed%20%21important%3B%0A%7D%0A" />
```

Which is a hack that works in the html5 body.

Originally found here: https://stackoverflow.com/a/41982945/3393964
