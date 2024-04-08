<script lang="ts">
	import '../../output.css';

	let newToDo: string = '';
	let newDueDate;

	function save() {

	}
	
	function add(){
		alert("Added!");

		return true;
	}
</script>

<div class="mainContainer" >
	<div class="headerContainer">
		<h1>To-Do:</h1>
		<button class="addButton" on:click={save}>Save</button>
	</div>

	<main class="mainToDo">
		<label class="todoLabel">
			<p class={ newToDo ? "above" : "center"}>To-do:</p>
			<input class="todo" bind:value={newToDo} type="text" placeholder="New To-Do:" />
			<button class="addButton" on:click={add}>+</button>
		</label>
		
	</main>
</div>