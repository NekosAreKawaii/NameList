# Name List

Welcome to the **Name List** repository! 
<br>
This project is a collection of usernames and parts of usernames.
<br>
Our aim is to provide a comprehensive database of usernames for various purposes, such as research, development, or other creative uses.

## How to Use

You can browse the collection of usernames and parts of usernames available in this repository.

## Example

### JS

* [HTML Generator](https://repo.julias.zone/fun/username/)

### Java
```java
    private static final List<String> USERNAME_PARTS = new ArrayList<>();
    private static final int MAX_USERNAME_LENGTH = 16;
    private static final int MAX_USERNAME_PARTS = 1000;

    public static void loadUsernameParts() {
        final String usernameFileUrl = "https://raw.githubusercontent.com/NekosAreKawaii/NameList/main/usernames";
        try (final HttpClient client = HttpClient.newHttpClient()) {
            final HttpRequest request = HttpRequest.newBuilder().uri(URI.create(usernameFileUrl)).build();
            client.sendAsync(request, HttpResponse.BodyHandlers.ofString()).thenApply(HttpResponse::body).thenAccept(body -> {
                final List<String> usernameParts = Arrays.asList(body.split("\n"));
                Collections.shuffle(usernameParts);
                USERNAME_PARTS.clear();
                USERNAME_PARTS.addAll(usernameParts.subList(0, Math.min(usernameParts.size(), MAX_USERNAME_PARTS)));
            }).join();
            System.out.println("Loaded " + USERNAME_PARTS.size() + " username parts.");
        } catch (final Exception e) {
            e.printStackTrace();
        }
    }

    public static String generateUsername() {
        Collections.shuffle(USERNAME_PARTS);
        final Random random = ThreadLocalRandom.current();
        String username = USERNAME_PARTS.get(random.nextInt(USERNAME_PARTS.size()));
        username += USERNAME_PARTS.get(random.nextInt(USERNAME_PARTS.size()));
        if (username.length() > MAX_USERNAME_LENGTH) {
            username = username.substring(0, MAX_USERNAME_LENGTH);
        }
        return username;
    }
```
### Python
```python
import requests
import secrets

URL = 'https://raw.githubusercontent.com/NekosAreKawaii/NameList/main/usernames'

def load_parts(parts: list):
    req = requests.get(URL)
    for line in req.text.split("\n"):
        if line == '':
            continue
        parts.append(line)

def generate_part(parts: list, current_length: int, max_length: int) -> str:
    part = 'a' * (max_length + 1)
    tries = 0
    while len(part) + current_length > max_length and tries < 10:
        part = parts[secrets.randbelow(len(parts))]
        tries += 1
    return part

def generate_name(parts: list, max_length=16) -> str:
    name = ''
    while len(name) < max_length:
        part = generate_part(parts, len(name), max_length)
        name += part
    if len(name) > max_length:
        name = name[:max_length]
    return name

if __name__ == "__main__":
    parts = []
    load_parts(parts)
    for _ in range(5):
        print(generate_name(parts))

```

## Contributing

We welcome contributions to this project!
<br>
If you have a set of usernames or parts of usernames that you think would be a valuable addition, please feel free to contribute.

### How to Contribute

1. Fork the repository
2. Create a new branch: `git checkout -b <branch-name>`
3. Make your changes inside the usernames file and commit them: `git commit -m 'Added <username>'`
4. Push to the branch: `git push origin <branch-name>`
5. Submit a pull request

## Removing a Username

If you find a username that you own and wish to have it removed from this repository, please create an issue with the following information:

1. The username you want to be removed
2. The reason for the removal request

We will review your request and take the appropriate action to remove the username from our collection.

## Issues and Feedback

If you encounter any issues or have suggestions for improving this repository, please open an issue in the Issues tab of this repository.
<br>
We appreciate your feedback and are always looking to improve.


Thank you for using the Name List repository!

