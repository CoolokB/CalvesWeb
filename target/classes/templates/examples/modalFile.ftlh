<div class="container">
    <div class="row">
        <div class="col-8">
            <form class="needs-validation" novalidate>
                <div class="form-group">
                    <label for="name">Name*</label>
                    <input type="text" class="form-control" id="name" placeholder="Your name" required>
                    <div class="valid-tooltip">
                        Looks good!
                    </div>
                    <div class="invalid-tooltip">
                        Please add a name.
                    </div>
                </div>

                <div class="form-group">
                    <label for="telephone">Telephone*</label>
                    <input type="text" class="form-control" id="telephone" placeholder="Your telephone number" required
                           minlength="7" maxlength="12">
                    <div class="valid-tooltip">
                        Looks good!
                    </div>
                    <div class="invalid-tooltip">
                        Please choose a valid telephone number (between 7 and 10 characters).
                    </div>
                </div>

                <div class="form-group">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" id="address" placeholder="Your delivery address" required>
                    <div class="valid-tooltip">
                        Looks good!
                    </div>
                    <div class="invalid-tooltip">
                        Please add an address.
                    </div>
                </div>

                <div class="form-group">
                    <select class="custom-select" required>
                        <option value="">Select a menu*</option>
                        <option value="1">Breakfast</option>
                        <option value="2">Lunch</option>
                        <option value="3">Dinner</option>
                    </select>
                    <div class="valid-tooltip">
                        Looks good!
                    </div>
                    <div class="invalid-tooltip">
                        Please choose a menu.
                    </div>
                </div>

                <div class="form-group">
                    <label>I need cutlery:</label>
                    <div class="custom-control custom-radio">
                        <input type="radio" id="yes" name="cutlery" class="custom-control-input" required>
                        <label class="custom-control-label" for="yes">Yes</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input type="radio" id="no" name="cutlery" class="custom-control-input" required>
                        <label class="custom-control-label" for="no">No</label>
                        <div class="valid-tooltip">
                            Looks good!
                        </div>
                        <div class="invalid-tooltip">
                            Please specify if you need cutlery.
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-info">Submit</button>
            </form>
        </div>
    </div>
</div>