<nav>
    <a href="/">Home</a>
    <a href="/teacher">Teacher's panel</a>
    <a href="/about/hello-world">Hello World!</a>
    <a href="/teacher/assignment">Assignment</a>
</nav>

<slot></slot>

<style>
    nav {
        display: flex;
        justify-content: space-around;
        align-items: center;
        background-color: #f4f4f4;
        padding: 1rem;
    }
    nav a {
        text-decoration: none;
        color: #333;
    }
</style>