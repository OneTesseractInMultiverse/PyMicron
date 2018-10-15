from functools import wraps
from flask import (
    jsonify
)
from flask_jwt_extended import (
    get_raw_jwt
)


# ---------------------------------------------------------------------------------------
# DECORATOR REQUIRE CLAIMS
# ---------------------------------------------------------------------------------------
def get_user_claims(parsed_identity) -> list:
    user_claims = []
    return user_claims


# ---------------------------------------------------------------------------------------
# HAS INTERSECTION
# ---------------------------------------------------------------------------------------
def contains_required_claims(all_required_claims, all_user_claims) -> bool:
    """
        Given a list with all the required claims. It checks that all the required claims
        exist within the set of user claims. If user has all required claims, then the
        identity is validated correctly.

        :param all_required_claims:
        :param all_user_claims:
        :return: bool - True  is all claims are present, false if some required claims are
                 not present
    """
    return set(all_required_claims).issubset(set(all_user_claims))


# ---------------------------------------------------------------------------------------
# DECORATOR REQUIRE CLAIMS
# ---------------------------------------------------------------------------------------
def require_claims(* required_claims):
    """
        This wrapper checks the current identity token contains the required claims to
        access the wrapped function. If at least of the required claims is not present,
        then it return a json response with a 401 Unauthorized HTTP Code to the user.

        This wrapper should only be used on functions that implement valid flask routes.
        :param required_claims:
        :return:
    """
    def wrapper(f):
        @wraps(f)
        def wrapped(*args, **kwargs):
            # Get a list of strings that represent the user's claims
            user_claims = get_user_claims(get_raw_jwt())
            # We check that the required required_claims are present in
            if not contains_required_claims(required_claims, user_claims):
                return jsonify({
                    "message": "Presented identity does not posses all the required claims"
                }), 401
            return f(*args, **kwargs)
        return wrapped
    return wrapper
