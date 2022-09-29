from django.db import migrations


def move_profiles(apps, schema_editor):
    OldProfile = apps.get_model("oc_lettings_site", "Profile")
    NewProfile = apps.get_model("profiles", "Profile")

    objs = list()

    for old_object in OldProfile.objects.all():
        user = old_object.user
        favorite_city = old_object.favorite_city

        new_profile = NewProfile(user=user, favorite_city=favorite_city)
        objs.append(new_profile)

    NewProfile.objects.bulk_create(objs)


class Migration(migrations.Migration):

    dependencies = [
        ("oc_lettings_site", "0004_auto_20220917_1622"),
    ]

    operations = [
        migrations.RunPython(move_profiles, migrations.RunPython.noop),
    ]
