<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Employee Management</title>
    <link rel="stylesheet" href="../style/style.css">
</head>
<style>
    @import url('https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css');
    @import url(https://fonts.googleapis.com/css?family=Open+Sans:400,300);

    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    /* Navigation bar styles */
    .navbar {
        background-color: #333;
        overflow: hidden;
    }

    .navbar a {
        float: left;
        display: block;
        color: #f2f2f2;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
    }

    .navbar a:hover {
        background-color: #ddd;
        color: black;
    }

    .navbar .logo {
        font-size: 20px;
        font-weight: bold;
    }

    /* style.css */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        padding: 20px;
    }

    .container {
        max-width: 1000px;
        margin: 50px auto;
        background: white;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
    }

    label {
        display: block;
        margin-bottom: 5px;
    }

    input[type="text"],
    input[type="email"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    input[type="submit"] {
        background-color: #5c9bb8;
        color: white;
        border: none;
        padding: 10px;
        border-radius: 4px;
        cursor: pointer;
        width: 100%;
    }

    input[type="submit"]:hover {
        background-color: #4c64ae;
    }


    /* Navigation bar styles */
    .navbar {
        background-color: #333;
        overflow: hidden;
    }

    .navbar a {
        float: left;
        display: block;
        color: #f2f2f2;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
    }

    .navbar a:hover {
        background-color: #ddd;
        color: black;
    }

    .navbar .logo {
        font-size: 20px;
        font-weight: bold;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    table th, table td {
        padding: 12px;
        text-align: left;
        border: 1px solid #dee2e6;
    }

    table th {
        background-color: #007bff;
        color: white;
    }

    table tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    table tr:hover {
        background-color: #e9ecef;
    }

    table td[colspan="6"] {
        text-align: center;
        font-style: italic;
        color: #777;
    }

    .alert {
        background: #ffdb9b;
        padding: 20px 40px;
        min-width: 420px;
        position: absolute;
        right: 0;
        top: 10px;
        border-radius: 4px;
        border-left: 8px solid #ffa502;
        overflow: hidden;
        opacity: 0;
        pointer-events: none;
    }

    .alert.showAlert {
        opacity: 1;
        pointer-events: auto;
    }

    .alert.show {
        animation: show_slide 1s ease forwards;
    }

    @keyframes show_slide {
        0% {
            transform: translateX(100%);
        }
        40% {
            transform: translateX(-10%);
        }
        80% {
            transform: translateX(0%);
        }
        100% {
            transform: translateX(-10px);
        }
    }

    .alert.hide {
        animation: hide_slide 1s ease forwards;
    }

    @keyframes hide_slide {
        0% {
            transform: translateX(-10px);
        }
        40% {
            transform: translateX(0%);
        }
        80% {
            transform: translateX(-10%);
        }
        100% {
            transform: translateX(100%);
        }
    }

    .alert .fa-exclamation-circle {
        position: absolute;
        left: 20px;
        top: 50%;
        transform: translateY(-50%);
        color: #ce8500;
        font-size: 30px;
    }

    .alert .msg {
        padding: 0 20px;
        font-size: 18px;
        color: #ce8500;
    }

    .alert .close-btn {
        position: absolute;
        right: 0px;
        top: 50%;
        transform: translateY(-50%);
        background: #ffd080;
        padding: 20px 18px;
        cursor: pointer;
    }

    .alert .close-btn:hover {
        background: #ffc766;
    }

    .alert .close-btn .fas {
        color: #ce8500;
        font-size: 22px;
        line-height: 40px;
    }

    .alert {
        margin: 10px 0px;
        padding: 12px;
        border-radius: 5px;

        font-family: 'Open Sans', sans-serif;
        font-size: .9rem;
        font-weight: 300;
        letter-spacing: 1px;
    }

    .alert:hover {
        cursor: pointer;
    }

    .alert:before {
        padding-right: 12px;
    }

    .alert:after {
        content: '\f00d';
        font-family: 'FontAwesome';
        float: right;
        padding: 3px;

        &:hover {
            cursor: pointer;
        }
    }

    .alert-error {
        color: #D8000C;
        background-color: #FFBABA;
        border: 1px solid #FFBABA;
    }

    .alert-error:before {
        content: '\f057';
        font-family: 'FontAwesome';
    }

    .alert-success {
        color: #10518a;
        background-color: #DFF2BF;
        border: 1px solid #DFF2BF;
    }

    .alert-success:before {
        content: '\f058';
        font-family: 'FontAwesome';
    }
    .addem {
        background-color: #283da7;
        color: white;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        font-size: 16px;
        transition: background-color 0.3s;
        margin-top: 22px;
        display: inline-block;
    }
    .addem:hover {
        background-color: #212f88;
    }
    /* Style for the filter form */
    #filterForm {
        background-color: #f0f8ff; /* Light blue background */
        padding: 15px; /* Padding inside the form */
        border: 2px solid blue; /* Blue border */
        border-radius: 4px; /* Rounded corners */
        margin-top: 10px; /* Space above the form */
        display: flex;
        flex: auto;
        justify-content: space-between;
        align-items: baseline;
    }

    /* Style for the checkboxes and labels */
    .filter-checkboxes {
        display: flex; /* Use flexbox for inline layout */
        flex-wrap: wrap; /* Allow wrapping to the next line if needed */
        margin-bottom: 10px; /* Space below the checkboxes */
    }

    .filter-checkboxes label {
        display: inline-block; /* Keep labels inline */
        margin-right: 15px; /* Space between checkboxes */
        color: blue; /* Blue text color */
    }

    /* Style for the submit button */
    #filterForm button {
        background-color: blue; /* Blue button */
        color: white; /* White text color */
        padding: 10px 15px; /* Padding for the button */
        border: none; /* Remove border */
        border-radius: 4px; /* Rounded corners */
        cursor: pointer; /* Pointer cursor on hover */
        font-size: 16px; /* Font size */
    }

    /* Change button color on hover */
    #filterForm button:hover {
        background-color: darkblue; /* Darker blue on hover */
    }

    /* Style for the search input */
    #search-input {
        display: block; /* Block level for full width */
        width: 100%; /* Full width */
        padding: 10px; /* Add some padding */
        border: 2px solid blue; /* Blue border */
        border-radius: 4px; /* Rounded corners */
        font-size: 16px; /* Font size */
        margin-top: 10px; /* Space above the search input */
    }
    .deletebtn {
        background-color: #ff4d4d; /* Red background */
        color: white; /* White text color */
        padding: 10px 20px; /* Padding for the button */
        border: none; /* No border */
        border-radius: 4px; /* Rounded corners */
        font-size: 16px; /* Font size */
        cursor: pointer; /* Pointer cursor on hover */
        transition: background-color 0.3s ease; /* Smooth transition for background color */
        margin: 5px; /* Space around the button */
    }

    /* Change button color on hover */
    .deletebtn:hover {
        background-color: #ff1a1a; /* Darker red on hover */
    }

    /* Optional: Add a focus effect for accessibility */
    .deletebtn:focus {
        outline: none; /* Remove default focus outline */
        box-shadow: 0 0 0 2px rgba(255, 0, 0, 0.5); /* Add a shadow effect */
    }
    .edit-link {
        background-color: #4f8e2f; /* Red background */
        color: #FFF; /* Bootstrap primary blue color */
        text-decoration: none; /* Remove underline */
        padding: 8px 16px; /* Add padding for a button-like feel */
        border-radius: 4px; /* Rounded corners */
        transition: background-color 0.3s ease, color 0.3s ease; /* Smooth transitions */
    }

    /* Change link color on hover */
    .edit-link:hover {
        background-color: #e2e6ea; /* Light grey background on hover */
        color: #0056b3; /* Darker blue text on hover */
    }

    /* Optional: Add focus effect for accessibility */
    .edit-link:focus {
        outline: none; /* Remove default focus outline */
        box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.5); /* Add a shadow effect */
    }

    label {
        font-size: 16px; /* Set font size for the label */
        color: #333; /* Dark gray color for the label */
        margin-bottom: 8px; /* Space below the label */
        display: inline-block; /* Ensures label takes full width */
    }

    select {
        width: 100%; /* Full width */
        padding: 10px; /* Add padding for better touch targets */
        font-size: 16px; /* Font size for the dropdown */
        border: 1px solid #ccc; /* Light gray border */
        border-radius: 4px; /* Rounded corners */
        background-color: #fff; /* White background */
        transition: border-color 0.3s ease; /* Smooth border transition */
        outline: none; /* Remove default outline */
    }

    /* Change border color on focus */
    select:focus {
        border-color: #007bff; /* Change border color to blue on focus */
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* Light blue shadow */
    }

    /* Optional: Style the disabled option */
    select option:disabled {
        color: #999; /* Gray color for the disabled option */
    }

</style>
<body>
<jsp:include page="navbar.jsp" />


