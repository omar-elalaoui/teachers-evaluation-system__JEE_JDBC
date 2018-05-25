<!DOCTYPE html>
<html lang="en" class="loginPage">

<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="inc/css/style.css" >
	<link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400" rel="stylesheet">
	<style type="text/css">
		a{
			text-decoration: none;
			color: #ecf0f1;
			text-transform: lowercase;
		}
		a:hover{
			text-decoration: underline;
			color: #bdc3c7;
		}
	</style>
</head>

<body>
    <div class="c-form__container">
        <div class="c-form__wrapper c-form__wrapper--login">
            <div class="c-form__image1">
                <img src="inc/images/admin.png">
            </div>
            <div class="c-form__titre">Système d'evaluation</div>
            <div class="c-form__picture2">
                <img src="inc/images/minad.png">
            </div>
            <div class="c-form__title c-form__title--login">Admin</div>
            <form class="c-form c-form--login" action="LoginAdmin" method="post">
                <div class="c-form__input-container">
                    <input class="c-form__input" type="email" placeholder="Email"  name="userEmail" />
                </div>
                <div class="c-form__input-container">
                    <div class="c-form__input-wrapper">
                        <input class="c-form__input" type="password" placeholder="Mot de passe"  name="pwd"/>
                    </div>
                </div>
                <div class="c-form__input-container">
                    <button class="c-form__button">Login</button>
                </div><br>
                <a href="modifierPwdAdmin.jsp" target="_blank">Modifier le mot de passe ?</a><br>
                <a href="oublierPwdAdmin.jsp" target="_blank">Mot de passe oublié ?</a>
            </form>
        </div>
        <div class="c-form__wrapper c-form__wrapper--signup">
            <div class="c-form__image2">
                <img src="inc/images/assistant.png">
            </div>
            <div class="c-form__titre2">Système d'evaluation</div>
            <div class="c-form__picture1">
                <img src="inc/images/minassis.png">
            </div>
            <div class="c-form__title c-form__title--signup">Assistant</div>
            <form class="c-form c-form--signup" action="LoginAssistant" method="post">
                <div class="c-form__input-container">
                    <input class="c-form__input" type="email" placeholder="Email" name="userEmail"/>
                </div>
                <div class="c-form__input-container">
                    <div class="c-form__input-wrapper">
                        <input class="c-form__input" type="password" placeholder="Mot de passe" name="pwd"/>
                    </div>
                </div>
                <div class="c-form__input-container">
                    <button class="c-form__button">Login</button>
                </div><br>
                <a href="modifierPwdAsst.jsp?user=assistant" target="_blank">Modifier le mot de passe ?</a><br>
                <a href="oublierPwdAsst.jsp?user=assistant" target="_blank">Mot de passe oublié ?</a>
            </form>
        </div>
    </div>
    <script >
        /*--script de Login--*/
            var passwordInputs = document.querySelectorAll('.c-form__input[type="password"]');
            var showHides = document.querySelectorAll('.c-form__input-show');

            var _loop = function _loop(i) {
              showHides[i].addEventListener('click', function () {
                if (passwordInputs[i].getAttribute('type') === 'password') {
                  passwordInputs[i].setAttribute('type', 'text');
                  showHides[i].innerHTML = 'Hide';
                } else {
                  passwordInputs[i].setAttribute('type', 'password');
                  showHides[i].innerHTML = 'Show';
                }
              });
            };

            for (var i = 0; i < showHides.length; i++) {
              _loop(i);
            }

            var loginContainer = document.querySelector('.c-form__wrapper--login');
            var signupContainer = document.querySelector('.c-form__wrapper--signup');

            loginContainer.addEventListener('click', function () {
              if (document.body.classList.contains('signup_active')) {
                document.body.classList.remove('signup_active');
              }
            });
            signupContainer.addEventListener('click', function () {
              if (!document.body.classList.contains('signup_active')) {
                document.body.classList.add('signup_active');
              }
            });
    /*--fin script de Login--*/
    </script>
</body>

</html>
