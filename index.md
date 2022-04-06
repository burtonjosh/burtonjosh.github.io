@def title = "Personal Website"
@def tags = ["syntax", "code"]

# Setup
## Update title

## Update config.md file

  * change author
  * add site name

## Create a table of contents

\toc

## Upload using Github

# Examples

## How to enter text
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc feugiat eros id libero faucibus, nec eleifend orci feugiat. Nunc et justo a nunc laoreet sodales rhoncus a purus. Pellentesque viverra, ex ac blandit varius, mi nunc gravida dolor, quis luctus nulla ex nec tellus. Maecenas id elit a neque tempus blandit. Nullam sapien magna, iaculis in molestie quis, tempus sed ante. Sed mauris lectus, accumsan sed velit vel, hendrerit malesuada sem. Praesent quis posuere erat, vitae aliquam risus. Proin dapibus sem posuere gravida hendrerit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin congue malesuada velit vel auctor. Mauris et metus ac sem venenatis efficitur. Donec dapibus tincidunt aliquam. Sed sagittis arcu eget mi commodo, id maximus leo sollicitudin. Vivamus at vulputate nunc, nec tempus massa. Etiam condimentum metus ac augue aliquet feugiat.

Aenean eget egestas augue. Sed pellentesque vehicula lacinia. Vivamus in ullamcorper mauris. Morbi et placerat lectus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vivamus et odio mi. Donec ac ultricies massa. Fusce facilisis aliquet ex a dapibus. Fusce finibus justo vel ex dictum, et lacinia odio pulvinar. Cras aliquam tristique auctor.

Aliquam feugiat nunc at sapien volutpat, non dictum justo tristique. Nam nec nunc lectus. Etiam ultricies leo leo, eu consequat nibh placerat et. Vestibulum magna lorem, fermentum sed metus vitae, volutpat tincidunt lacus. Fusce mattis metus dictum facilisis cursus. Ut a fringilla velit, in fermentum est. Vestibulum eget ultricies tortor, et pretium ipsum. Praesent placerat ex et elit ullamcorper, id rutrum nulla fermentum. Mauris venenatis convallis ante ac euismod. Nulla eu felis venenatis, maximus leo et, eleifend purus.

Nulla facilisi. Mauris ultrices mattis nisl, eget sagittis dui condimentum eu. Mauris tempor varius lorem ut placerat. Integer quis convallis leo, pharetra porttitor erat. Ut euismod nunc ut lacus vulputate posuere. Morbi efficitur ante in porta lacinia. Suspendisse sed venenatis nulla. Morbi in faucibus arcu. Etiam tincidunt, enim id lobortis varius, ante ex tristique urna, ut fermentum nulla ligula id sem.

Vivamus blandit tortor quis quam fringilla varius. Donec ante ex, iaculis sed libero a, consectetur eleifend ipsum. Donec neque ante, eleifend vel commodo sed, bibendum ut libero. Sed maximus pellentesque elementum. Nunc a ultrices sem, nec laoreet urna. Nulla ornare diam vitae aliquam tincidunt. Proin sit amet aliquet metus, a vulputate arcu. Maecenas in feugiat enim. Pellentesque et sem in purus blandit dignissim.

## How to render maths equations

Just use LaTeX:
$$a^2 + b^2 = c^2$$

## How to insert Julia code (with outputs!)
Hello World!
```julia:./test
println("Hello, World!")
```
\show{./test}

```julia:./test2
using Distributions, Random
Random.seed!(1)
rand(Exponential(10.0),10)
```

\show{./test2}
