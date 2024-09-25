package florastore.googleAccount;

import com.google.gson.Gson;
import florastore.utils.Iconstant;
import com.google.gson.JsonObject;
import florastore.googleAccount.GoogleAccount;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.ClientProtocolException;
import java.io.IOException;

public class GoogleLogin {
    public static String getToken(String code) throws ClientProtocolException, IOException {
        // Make a POST request to the Google OAuth token endpoint
        String response = Request.Post(Iconstant.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(
                        Form.form()
                                .add("client_id", Iconstant.GOOGLE_CLIENT_ID)
                                .add("client_secret", Iconstant.GOOGLE_CLIENT_SECRET)
                                .add("redirect_uri", Iconstant.GOOGLE_REDIRECT_URI)
                                .add("code", code)
                                .add("grant_type", Iconstant.GOOGLE_GRANT_TYPE)
                                .build()
                )
                .execute()
                .returnContent()
                .asString();

        // Parse the JSON response to extract the access token
        JsonObject jsonObject = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jsonObject.get("access_token").getAsString();

        return accessToken;
    }
    
    public static GoogleAccount getUserInfo(final String accessToken) throws ClientProtocolException, IOException {

        String link = Iconstant.GOOGLE_LINK_GET_USER_INFO + accessToken;

        String response = Request.Get(link).execute().returnContent().asString();

        GoogleAccount googlePojo = new Gson().fromJson(response, GoogleAccount.class);

        return googlePojo;

    }
}
