<script lang="ts">
	import type { PageData } from './$types';
	
	export let data: PageData;
</script>

<h1>Assignments</h1>

{#each data.assignmnets as assignment, i}
    <table>
        <tr>
            <td>
                <h2>{assignment.title}</h2>
                <div>
                    <table>
                        <tr>
                            <td>Course</td>
                            <td>{assignment.course}</td>
                        </tr>
                        <tr>
                            <td>Configuration in use</td>
                            <td>{assignment.config}</td>
                        </tr>
                        <tr>
                            <td>Starting Date</td>
                            <td>{assignment.startDate}</td>
                        </tr>
                        <tr>
                            <td>Submission Due</td>
                            <td>{assignment.endDate}</td>
                        </tr>
                        <tr>
                            <td>Visible for students</td>
                            <td>{assignment.isVisible}</td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
{/each}

<style>
    /* Add a border to the table */
    /* Add spacing between the tables */
    table {
        border: 1px solid black;
        margin: 10px;
    }
</style>