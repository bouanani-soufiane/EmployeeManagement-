<jsp:include page="../component/header.jsp"/>
<div class="container">
    <div class="alert alert-success hide" id="successAlert">Employee is registered successfully</div>
    <div class="alert alert-error hide" id="errorAlert">Error! There was a problem processing your request.</div>
    <div class="alert hide">
        <span class="fas fa-exclamation-circle"></span>
        <div class="close-btn">
            <span class="fas fa-times"></span>
        </div>
    </div>
    <h2>Add Employee</h2>

    <form id="employeeForm">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>

        <label for="phone">Phone:</label>

        <input type="text" id="phone" name="phone" required><br><br>

        <label for="department">Department:</label>
        <select id="department" name="department" required>
            <option value="" disabled>Select a department</option>
            <option value="HR">Human Resources</option>
            <option value="IT">Information Technology</option>
            <option value="Finance">Finance</option>
            <option value="Sales">Sales</option>
        </select><br><br>


        <label for="position">Position:</label>
        <input type="text" id="position" name="position" required><br><br>

        <input type="submit" value="Add Employee">
    </form>
</div>

<script>
    const form = document.getElementById('employeeForm');
    const successAlert = document.getElementById('successAlert');
    const errorAlert = document.getElementById('errorAlert');
    form.addEventListener('submit', function (event) {
        event.preventDefault();
        const formData = new URLSearchParams(new FormData(this)).toString();

        fetch("/store", {
            method: "POST",
            body: formData,
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            }
        })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                console.log(response)
                return response.json();
            })
            .then(json => {
                console.log(json);
                successAlert.classList.remove('hide');
                successAlert.classList.add('showAlert');
                setTimeout(() => {
                    successAlert.classList.add('hide');
                }, 3000);
            })
            .catch(error => {
                console.error('There has been a problem with your fetch operation:', error);

                errorAlert.classList.remove('hide');
                errorAlert.classList.add('showAlert');

                setTimeout(() => {
                    errorAlert.classList.add('hide');
                }, 3000);
            });
    });


</script>

<jsp:include page="../component/footer.jsp"/>