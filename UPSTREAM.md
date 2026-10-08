# Upstream

| | |
| --- | --- |
| Project | OWASP Security Knowledge Framework labs (SKF labs) |
| Repository | https://github.com/blabla1337/skf-labs |
| Lab | `python/JWT-null` (Python) |
| Version | master (SKF labs has no releases) |
| Commit | 35199b6f49658b75f860530c0f09b91e985198aa |
| Licence | Apache-2.0 |

| Here | SKF labs path |
| --- | --- |
| `build/web/app/` | [`python/JWT-null`](https://github.com/blabla1337/skf-labs/tree/35199b6f49658b75f860530c0f09b91e985198aa/python/JWT-null) |

The vendored folder is that commit's lab folder, unchanged, without its Git history.

`build/web/Dockerfile` is the lab's Dockerfile with `COPY ./` changed to `COPY app/`, and: the page script is edited in the image to call the API on the page's own host and port instead of a hard-coded port 5000 (the lab publishes on 5050; macOS keeps 5000 for AirPlay).

To update, replace the vendored folder with a newer SKF labs commit, then change this file.
