
SELECT
    c.CustomerId,
    c.FirstName AS customer_fname,
	c.LastName AS customer_lname,
    c.Country,
    c.City,
    i.InvoiceId,
    i.InvoiceDate,
    il.InvoiceLineId,
    il.UnitPrice,
    il.Quantity,
    t.TrackId,
    t.Name AS TrackName,
    t.Composer,
    t.Milliseconds AS Duration,
    t.Bytes AS Size,
    g.Name AS Genre,
    mt.Name AS MediaType,
    a.AlbumId,
    a.Title AS AlbumTitle,
    ar.ArtistId,
    ar.Name AS ArtistName,
    e.EmployeeId AS empID,
    e.FirstName AS emp_fname,
    e.LastName AS emp_lname,
    e.Title AS emp_title,
    p.Name AS PlaylistName
FROM
    Customer c
JOIN 
    Invoice i ON c.CustomerId = i.CustomerId
JOIN 
    InvoiceLine il ON i.InvoiceId = il.InvoiceId
JOIN 
    Track t ON il.TrackId = t.TrackId
JOIN 
    Genre g ON t.GenreId = g.GenreId
JOIN 
    MediaType mt ON t.MediaTypeId = mt.MediaTypeId
JOIN 
    Album a ON t.AlbumId = a.AlbumId
JOIN 
    Artist ar ON a.ArtistId = ar.ArtistId
LEFT JOIN 
    Employee e ON c.SupportRepId = e.EmployeeId
LEFT JOIN 
    PlaylistTrack pt ON t.TrackId = pt.TrackId
LEFT JOIN 
    Playlist p ON pt.PlaylistId = p.PlaylistId
ORDER BY 
    i.InvoiceDate DESC;


Alter VIEW V1 AS
SELECT
    c.CustomerId,
    c.FirstName AS customer_fname,
	c.LastName AS customer_lname,
    c.Country,
    c.City,
    i.InvoiceId,
    i.InvoiceDate,
    il.InvoiceLineId,
    il.UnitPrice,
    il.Quantity,
    t.TrackId,
    t.Name AS TrackName,
    t.Composer,
    t.Milliseconds AS Duration,
    t.Bytes AS Size,
    g.Name AS Genre,
    mt.Name AS MediaType,
    a.AlbumId,
    a.Title AS AlbumTitle,
    ar.ArtistId,
    ar.Name AS ArtistName,
    e.EmployeeId AS empID,
    e.FirstName AS emp_fname,
    e.LastName AS emp_lname,
    e.Title AS emp_title
FROM
    Customer c
JOIN 
    Invoice i ON c.CustomerId = i.CustomerId
JOIN 
    InvoiceLine il ON i.InvoiceId = il.InvoiceId
JOIN 
    Track t ON il.TrackId = t.TrackId
JOIN 
    Genre g ON t.GenreId = g.GenreId
JOIN 
    MediaType mt ON t.MediaTypeId = mt.MediaTypeId
JOIN 
    Album a ON t.AlbumId = a.AlbumId
JOIN 
    Artist ar ON a.ArtistId = ar.ArtistId
LEFT JOIN 
    Employee e ON c.SupportRepId = e.EmployeeId

SELECT invoiceid, invoicelineid FROM V1 order by invoiceid, invoicelineid;

