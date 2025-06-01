document.addEventListener("turbo:load", () => {
  const taskForm = document.querySelector("form[data-remote='true']");
  if (taskForm) {
    taskForm.addEventListener("ajax:success", (event) => {
      const [data, status, xhr] = event.detail;
      alert(data.message);
      document.getElementById("task-modal").classList.add("hidden");
    });

    taskForm.addEventListener("ajax:error", (event) => {
      const [data, status, xhr] = event.detail;
      alert("Error: " + data.errors.join(", "));
    });
  }
});
