<script lang="ts">
	//import '../output.css';
	let email: string = ""; // eMail
	let user: string = "Bob"; // Username
	let pass: string = ""; // Password
	let cpass: string = ""; // Confirm Password

	let register: boolean = true; // Register account mode flag

	let error: boolean = false; // Error flag during submit
	const minLen: number = 6; // Minimum password length

	let eError: boolean = false; // eMail error
	let pError: boolean = false; // Password error
	let cError: boolean = false; // Confirm password error (cpass != pass) || (cpass == '')

	let passeval_len: boolean = false; // Password eval bool: Contains enough chars
	let passeval_spc: boolean = false; // Password eval bool: Contains special char
	let passeval_cap: boolean = false; // Password eval bool: Contains upper-case
	let passeval_low: boolean = false; // Password eval bool: Contains lower-case
	let passeval_num: boolean = false; // Password eval bool: Contains number

	function toggle() {
		register = !register;
	}

	function validatePass() {
		passeval_cap = /[A-Z]/.test(pass);
		passeval_low = /[a-z]/.test(pass);
		passeval_num = /[0-9]/.test(pass);
		passeval_len = pass.length >= minLen;
		passeval_spc = /[!@#$%\^&*(),.<>?\'\"{}]/.test(pass);

		if (passeval_cap && passeval_low && passeval_num && passeval_len && passeval_spc) {
			return true;
		} else {
			return false;
		}
	}

	function validateEmail() {
		const hasDNS: boolean = (email.includes(".com") || email.includes(".org") || email.includes(".net")); // Error flag: eMAil contains a .dns
		const hasAT: boolean = email.includes("@"); // Error flag: eMail contains @ symbol
		const hasLen: boolean = (email.length > 6); // Error flag: eMAil is long enough

		if (hasDNS && hasAT && hasLen) {
			return true; // Valid eMAil
		}

		return false; // Invalid eMAil
	}

	function login() {
		passeval_cap = false;
		passeval_low = false;
		passeval_num = false;
		passeval_len = false;
		passeval_spc = false;

		eError = !validateEmail();
		pError = !validatePass();
		cError = false;

		if (register) {
			cError = cpass != pass || cpass == "";

			if (cError) cpass = "";
		}

		error = eError || pError || cError;

		if (error) {
			return false;
		} else {
			// LOGIN
			alert("Login!");
			window.location.pathname = '/dashboard';

		}
	}
</script>

<div class="authContainer">
	<form class="authForm">
		<h1 class="authHeader">{register ? "Sign up:" : "Login:"}</h1>
		<label class="authLabel">
			<p class={email ? "above" : "center"}>eMail:</p>
			<p class= {eError ? "invalid" : "center" }> Please enter a valid email! </p>
			<input class="authInput" bind:value={email} type="email" placeholder="eMail" />
		</label>

		<label class="authLabel">
			<p class={pass ? "above" : "center"}>Password:</p>
			<p class={pError ? "invalid" : "center"}>
				Please enter a valid password!
			</p>
			<input
				class="authInput"
				bind:value={pass}
				type="password"
				placeholder="Password"
			/>
		</label>

		{#if register}
			<label class="authLabel">
				<p class={cpass ? "above" : "center"}>Confirm Password:</p>
				<p class={cpass != pass ? "invalid" : "center"}>
					{ cpass != pass ? "Passwords do not match!" : "Please enter a valid password!" }
				</p>
				<input class="authInput" bind:value={cpass} type="password" placeholder="Confirm password" />
			</label>
		{/if}

		<button class="authButton" type="button" on:click={login}>{!register ? "Login" : "Sign Up"}</button>

		<div class="regOptions">
			<p class="regtog">
				{ register ? "Already have an account?" : "Don't have an account?" } <br />
				<a href="#" on:click={toggle} class="reglnk">{ register ? "Login" : "Sign Up" }</a>
			</p>
		</div>
	</form>
</div>
