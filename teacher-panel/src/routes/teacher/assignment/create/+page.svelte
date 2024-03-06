<script lang="ts">
	import type { PageData } from './$types';
	
	export let data: PageData;
</script>

<h2>Create an Assignment</h2>

<form method="POST">
    <label>
        Title
        <input type="text" id="title" name="title" required>
    </label>
    <label>
        Description
        <textarea id="description" name="description" required></textarea>
    </label>
    <label>
        Start Date
        <input type="date" id="startDate" name="startDate" required>
    </label>
    <label>
        Due Date
        <input type="date" id="dueDate" name="dueDate" required>
    </label>
    <label>
        Assignment Configuration
        <select id="assignmentConfig" name="assignmentConfig">
            {#each data.assignmentConfigs as { name, content }, i}
                <option value="{name}">{name}</option>
            {/each}
        </select>
    </label>
    <button type="submit">Create</button>
    <button type="reset">Reset</button>
</form>

<style>
    /* Center the form */
    form {
        display: flex;
        flex-direction: column;
        align-items: center;
        
    }
    /* Make description have a max width */
    textarea {
        max-width: 100%;
    }
</style>