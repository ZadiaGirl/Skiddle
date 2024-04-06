<script lang='ts'>
    let email: string = '';
    let user: string = '';
    let pass: string = '';
    let cpass: string = '';

    let min_pLen: number = 6;
    let error: boolean = false;
    let register: boolean = true;

    let eError: boolean = false;
    let pError: boolean = false;
    let cError: boolean = false;
    let perror_msg: string = "Invalid Password!\n";

    let passeval_cap: boolean = false;
    let passeval_low: boolean = false;
    let passeval_num: boolean = false;
    let passeval_len: boolean = false;
    let passeval_spc: boolean = false;

    function validatePass(){
        passeval_cap = (/[A-Z]/.test(pass));
        passeval_low = (/[a-z]/.test(pass));
        passeval_num = (/[0-9]/.test(pass));
        passeval_len = (pass.length >= min_pLen);
        passeval_spc = (/[!@#$%\^&*(),.<>?\'\"{}]/.test(pass));
        
        perror_msg = "Invalid Password! ";
    
        if(passeval_cap && passeval_low && passeval_num && passeval_len && passeval_spc) {
            return true;
        } else {
            if (!passvalObj.cap) {
                perror_msg += '\nPassword must contain at least 1 uppercase letter!';
            }

            if (!passvalObj.num) 
                perror_msg += '\nPassword must contain at least 1 number!';

            if (!passvalObj.len) 
                perror_msg += ('\nPassword must be at least ' + min_pLen + ' characters long!');
 
            if (!passvalObj.spc)
                perror_msg += "\nPassword must contain at least 1 special character!";

            alert(perror_msg);
            return false;
        }    
    } 

    function validateEmail() {
        if (email.includes('@') && (email.includes('.com') || email.includes('.org') || email.includes('.net')) && email.length > 6) {
            return true;
        }

        return false;
    }

    function login() {
        eError = !validateEmail();
        pError = !validatePass();
        cError = false;

        if (register) {            
            cError = (cpass != pass);

            if (cError)
                cpass = '';
        }

        error = (eError || pError || cError);

        if (error) {
            return false;
        } else {
            // LOGIN 
            alert('Login!');
        }
    }
</script>

<div class = "authContainer">
    <link rel='stylesheet' href='./auth.css'/>
    <form>
        <h1>Login:</h1>
        <label>
            <p class = {email ? "above" : "center"}>eMail:</p>
            <p class = {eError ? "invalid" : "center" }>Please enter a valid email!</p>
            <input bind:value={email} type = "email" placeholder="eMail"/>
        </label>

        <label>
            <p class = {pass ? "above" : "center"}>Password:</p>
            <p class = {pError ? "invalid" : "center" }>Please enter a valid password!</p>
            <input bind:value={pass} type = "password" placeholder="Password"/>
        </label>

        <label>
            <p class = {cpass ? "above" : "center"}>Confirm Password:</p>
            <p class = {cError ? "invalid" : "center" }>Passwords do not match!</p>
            <input bind:value={cpass} type = "password" placeholder="Confirm password"/>
        </label>

        <button type="button" on:click={login}>Submit</button>
        {#if passeval_cap}
        <p class = "emsg">Password must contain at least 1 uppercase letter!</p>
        {/if}
        
        {#if passeval_num}
        <p class = "emsg">Password must contain at least 1 number!</p>
        {/if}

		{#if passeval_len}
        <p class = "emsg">Password must be at least {min_pLen} characters long!</p>
		{/if}

		{#if passeval_spc}
        <p class = "emsg">Password must contain at least 1 special character!</p>
		{/if}
    </form>
</div>


<style>
    .authContainer {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        flex: 1;
        padding: 24px;
    }

    form {
        display: flex;
        flex-direction: column;
        gap: 14px;
        width: 400px;
        max-width: 100%;
        margin: 0 auto;
    }

    form input {
        width: 100%;
        border: none;
        background: transparent;
        color: white;
        text-align: center;
        padding: 8px 14px;
    }

    form input:focus {
        border: none;
        outline: none;
    }

    form label {
        position: relative;
        border: 1px solid navy;
        border-radius: 5px;
    }

    form button {
        background: #014e8d;
        color: #ffffff;
        border: none;
        border-radius: 5px;
        padding: 14px 0px;
        height: 32px;
        font-size: 1rem;
        text-align: center;
        justify-content: center;
    }

    form button:hover {
        background: #013763;
    }

    h1 {
        text-align: center;
        font-size: 3rem;
    }

    .above, .center {
        position: absolute;
        transform: translateY(-50%);
        pointer-events: none;
        color: white;
        border-radius: 4px;
        padding: 0 6px;
        font-size: 0.8rem;
    }

    .above {
        top: 0;
        left: 24px;
        border: 1 solid navy;
        background: navy;
        font-size: 0.7rem;
    }

    .center {
        top: 50%;
        left: 6px;
        border: 1px solid transparent;
        opacity: 0;
    }

    .emsg {
        position: relative;
        pointer-events: none;
        top: 50%;
        border: none;
        color: red;
        background: transparent;
        font-size: 1rem;
        text-align: left;

    }

    .invalid {
        position: absolute;
        transform: translateY(-50%);
        pointer-events: none;
        border-radius: 4px;
        padding: 0 6px;
        font-size: 0.75rem;
        font-weight: bold;
        text-align: right;

        top: 0;
        right: 10px;
        border: 1 solid navy;
        background: navy;
        color: red;
    }

</style>