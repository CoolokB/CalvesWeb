<#macro login path isRegisterForm>

        <div class="card loginCard shadow mx-auto">

            <div class="card-body">

                <div class="form-group">

                    <div class="text-center mb-4">
                        <h4 class="text-dark">
                            <#if !isRegisterForm>Welcome Back!<#else>Add new user!</#if>
                        </h4>
                    </div>

                    <form action="${path}" class="user" method="post">

                        <div class="form-group">
                            <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                                   class="form-control form-control-user ${(usernameError??)?string('is-invalid', '')} loginForm"
                                   placeholder="User name"/>
                            <#if usernameError??>
                                <div class="invalid-feedback">
                                    ${usernameError}
                                </div>
                            </#if>
                        </div>

                        <div class="form-group">
                            <input type="password" name="password"
                                   class="form-control form-control-user ${(passwordError??)?string('is-invalid', '')} loginForm"
                                   placeholder="Password"/>
                            <#if passwordError??>
                                <div class="invalid-feedback">
                                    ${passwordError}
                                </div>
                            </#if>
                        </div>

                        <#if isRegisterForm>

                            <div class="form-group">
                                <input type="password" name="password2"
                                       class="form-control form-control-user ${(password2Error??)?string('is-invalid', '')} loginForm"
                                       placeholder="Retype password"/>
                                <#if password2Error??>
                                    <div class="invalid-feedback">
                                        ${password2Error}
                                    </div>
                                </#if>
                            </div>

                            <div class="form-group">
                                <input type="email" name="email" value="<#if user??>${user.email}</#if>"
                                       class="form-control form-control-user ${(emailError??)?string('is-invalid', '')} loginForm"
                                       placeholder="some@some.com"/>
                                <#if emailError??>
                                    <div class="invalid-feedback">
                                        ${emailError}
                                    </div>
                                </#if>
                            </div>

                            <div class="form-group" style="margin-left: 4.2rem;">
                                <div class="g-recaptcha" data-sitekey="6LfXlrgZAAAAAJeEdbgCR8Shdtwf5bSZ0yOMPCSY"></div>
                                <#if captchaError??>
                                    <div class="alert alert-danger" role="alert">
                                        ${captchaError}
                                    </div>
                                </#if>
                            </div>

                        </#if>

                        <hr/>
                        <div class="form-group">
                            <button class="btn btn-primary btn-block text-white btn-user"
                                    type="submit"><#if isRegisterForm>Create<#else>Sign In</#if></button>
                        </div>

                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>

                    </form>

                    <#if !isRegisterForm>

                        <hr/>
                        <form action="/registration" class="user">
                            <button class="btn btn-success btn-block text-white btn-user"
                                    type="submit">Register
                            </button>
                        </form>

                    </#if>

                </div>

            </div>

        </div>

</#macro>




