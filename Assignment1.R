library(igraph)
library(rstudioapi)

#Task 1
nodes <- read.csv("./canadian_airports.csv", header=TRUE)
print(nodes)
nodes$city <- NULL

#Task 2
edges <- read.csv("./flight_edges.csv", header=TRUE) #Read the edges from csv
print(edges)
edges$number_of_flights <- NULL
print(edges)

#Task 3
airports <- graph_from_data_frame(edges, nodes, directed=FALSE)
print(airports, v=TRUE)

# Question 1
vcount(airports) # count vertices
ecount(airports) # count edges

# Question 2
#plot(airports)
#plot(airports, layout = layout_nicely(airports))
#plot(airports, layout = layout_as_tree(airports))
plot(airports, layout = layout_with_fr(airports, niter = 10000, start.temp=0.9))
plot(airports, layout = layout_in_circle(airports),  vertex.size=18, edge.arrow.size=0.5, vertex.label.cex=0.5)
coords <-  layout_with_fr(airports)
plot(airports, layout=coords, rescale=FALSE, xlim=range(coords[,1]*1.5), ylim=range(coords[,2]*1.5))

# Question 3
deg <- degree(airports) # store the degree sequence as a vector
print(deg)

mean(deg) # Compute the mean degree of the network

#Question 4
hist(deg) # Plot histogram from vector of degrees

#Question 5
A <- as.matrix(as_adjacency_matrix(airports)) # save the adjacency
print(A)
isSymmetric((A)) #check if the adjacency matrix is symmetric