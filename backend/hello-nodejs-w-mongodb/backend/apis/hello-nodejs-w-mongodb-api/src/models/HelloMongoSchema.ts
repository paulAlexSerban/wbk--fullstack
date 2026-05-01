import mongoose, { Schema, Document } from "mongoose";
import slugify from "slugify";

interface IHelloMongo extends Document {
  name: string;
  slug: string;
}

const HelloMongoSchema: Schema = new Schema(
  {
    name: {
      type: String,
      required: [true, "Please add a name"],
      unique: true,
      trim: true,
      maxlength: [50, "Name can not be more than 50 characters"],
    },
    slug: String,
  },
  {
    timestamps: true,
  }
);

HelloMongoSchema.pre<IHelloMongo>("save", async function (next) {
  this.slug = slugify(this.name, { lower: true });
  next();
});

export default mongoose.model<IHelloMongo>("HelloMongo", HelloMongoSchema);
